//
//  BRLMapViewController.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLMapViewController.h"
#import "BRLTransitStop.h"
#import "BRLMarkerInfoViewController.h"
#import "BRLBikeSpotStorage.h"
#import "BRLBikeSpot.h"

@interface BRLMapViewController ()

@end

@implementation BRLMapViewController {
    IBOutlet UIView *mapViewOnSreen;
    GMSMapView *_mapView;
    
    CLLocationManager *locationManager;
    
    NSMutableArray *transitStopMarkerList;
    NSMutableArray *bikePinMarkerList;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        if (!transitStopMarkerList) {
            transitStopMarkerList = [[NSMutableArray alloc] init];
        }
        
        if (!bikePinMarkerList) {
            bikePinMarkerList = [NSMutableArray array];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:BRL_SF_LAT
                                                            longitude:BRL_SF_LONG
                                                                 zoom:BRL_SF_ZOOM];

    _mapView = [GMSMapView mapWithFrame:mapViewOnSreen.bounds camera:camera];
    _mapView.myLocationEnabled = YES;
    _mapView.settings.myLocationButton = YES;

    _mapView.settings.zoomGestures = YES;
    _mapView.settings.scrollGestures = YES;
    _mapView.userInteractionEnabled = YES;
    
    _mapView.delegate = self;
    [mapViewOnSreen addSubview:_mapView];
    
    
    [self showMarkers];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMarkers
{
    for (GMSMarker *marker in transitStopMarkerList) {
        marker.map = _mapView;
    }
    
    for (GMSMarker *marker in bikePinMarkerList) {
        marker.map = _mapView;
    }
}

- (void)setTransitStops:(NSMutableArray*)transitStops
{
    if (!transitStopMarkerList) {
        transitStopMarkerList = [[NSMutableArray alloc] init];
    }
    for (GMSMarker *marker in transitStopMarkerList) {
        marker.map = nil;
    }
    
    for (GMSMarker *marker in bikePinMarkerList) {
        marker.map = nil;
    }
    
    [transitStopMarkerList removeAllObjects];
    [bikePinMarkerList removeAllObjects];
    
    for (BRLTransitStop *stop in transitStops) {
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = stop.locationCoordinate.coordinate;
        marker.title = stop.stopName;
        marker.icon = stop.stopTransitType == BRLTransitType_CALTRAIN ? [UIImage imageNamed:@"ic-CALTRAIN"]: [UIImage imageNamed:@"ic-BART"];
        marker.map = nil;
        
        [transitStopMarkerList addObject:marker];
    }
    
    for (BRLBikeSpot *bikeSpot in [[BRLBikeSpotStorage sharedStorage] allItems]) {
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = bikeSpot.bikeLocationCoordinate.coordinate;
        marker.title = bikeSpot.bikeName;
        marker.icon =[UIImage imageNamed:@"ic-bike60"];
        marker.map = nil;
        
        [bikePinMarkerList addObject:marker];
    }
    
}


#pragma mark - CLLocationManagerDelegate

-(void)findLocation {
    [locationManager startUpdatingLocation];
}

-(void)foundLocation:(CLLocation *)loc {
#ifdef DEBUG
	NSLog(@"BRLMapViewController.foundLocation");
#endif
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:[loc coordinate]
                                                               zoom:6];
    [_mapView setCamera:camera];
    
    [locationManager stopUpdatingLocation];
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    int index = [bikePinMarkerList indexOfObject:marker];
    if (index < 0 && index >= bikePinMarkerList.count) {
        return;
    }
    
    BRLMarkerInfoViewController *markerInfoVC = [[BRLMarkerInfoViewController alloc] init];
    [markerInfoVC setBikeSpot:[[[BRLBikeSpotStorage sharedStorage] allItems] objectAtIndex:index]];
    [self presentViewController:markerInfoVC animated:NO completion:nil];
}

@end
