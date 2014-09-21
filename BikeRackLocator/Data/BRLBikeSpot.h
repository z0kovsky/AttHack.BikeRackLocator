//
//  BRLBikeSpot.h
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BRLBikeSpot : NSObject

@property (nonatomic) int bikeID;
@property (nonatomic, strong) NSString *bikeName;
@property (nonatomic, strong) NSString *bikeAddress;
@property (nonatomic, strong) CLLocation *bikeLocationCoordinate;
@property (nonatomic, strong) NSMutableArray *bikeFeatures;

- (id)init;

@end
