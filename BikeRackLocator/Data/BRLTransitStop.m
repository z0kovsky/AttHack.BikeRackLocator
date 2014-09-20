//
//  BRLTransitStop.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLTransitStop.h"

@implementation BRLTransitStop

- (id)init
{
    if (self = [super init]) {

    }
    
    return self;
}

- (CLLocationCoordinate2D)getLocationCoordinate
{
    if ([self stopLocationCoordinate].longitude == 0) {
        return [self stopLocationCoordinate];
    }
    
    __block CLLocationCoordinate2D location;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:@"" completionHandler:^(NSArray* placemarks, NSError* error){
        CLPlacemark* aPlacemark = placemarks[0];
        [self setStopLocationCoordinate:aPlacemark.location.coordinate];
    }];
    
    return [self stopLocationCoordinate];
}

@end
