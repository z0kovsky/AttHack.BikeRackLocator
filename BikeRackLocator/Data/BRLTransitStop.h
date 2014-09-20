//
//  BRLTransitStop.h
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BRLTransitStop : NSObject

@property (nonatomic) int stopID;
@property (nonatomic, strong) NSString *stopName;
@property (nonatomic, strong) NSString *stopType;
@property (nonatomic, strong) NSString *stopAddress;
@property (nonatomic) CLLocationCoordinate2D stopLocationCoordinate;

- (id)init;

@end
