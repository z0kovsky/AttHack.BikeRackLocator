//
//  BRLMapViewController.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLMapViewController.h"

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTransitStops:(NSMutableArray*)transitStops
{
    if (!transitStopMarkerList) {
        transitStopMarkerList = [[NSMutableArray alloc] init];
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

- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
//    [mapView clear];
}

- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
//    id handler = ^(GMSReverseGeocodeResponse *response, NSError *error) {
//        if (error == nil) {
//            GMSReverseGeocodeResult *result = response.firstResult;
//            GMSMarker *marker = [GMSMarker markerWithPosition:cameraPosition.target];
//            marker.title = result.addressLine1;
//            marker.snippet = result.addressLine2;
//            marker.map = mapView;
//        }
//    };
//    [geocoder_ reverseGeocodeCoordinate:cameraPosition.target completionHandler:handler];
}
@end
