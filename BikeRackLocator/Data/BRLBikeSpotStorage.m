//
//  BRLBikeSpotStorage.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLBikeSpotStorage.h"
#import "BRLBikeSpot.h"
#import <CoreLocation/CoreLocation.h>

@implementation BRLBikeSpotStorage{
    NSMutableArray *allItems;
}


- (id)init
{
    if (self = [super init]) {
        allItems = [[NSMutableArray alloc] init];
        
        NSString *defaultSettingsPath = [[NSBundle mainBundle] pathForResource:@"bikeStopList" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:defaultSettingsPath];
        
        NSError *myError = nil;
        
        NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&myError];
        
        for (NSDictionary *item in items) {
            int idItem = [[item objectForKey:@"id"] intValue];
            NSString *name = [item objectForKey:@"name"];
            NSString *address = [item objectForKey:@"address"];
            
            NSMutableDictionary *location = [item objectForKey:@"location"];
            NSNumber *lon = [NSNumber numberWithDouble:[[location objectForKey:@"lon"] doubleValue]];
            NSNumber *lat = [NSNumber numberWithDouble:[[location objectForKey:@"lat"] doubleValue]];
            CLLocation *listingLocation = [[CLLocation alloc] initWithLatitude:[lat doubleValue] longitude:[lon doubleValue]];
            
            
            BRLBikeSpot *bikeSpot = [[BRLBikeSpot alloc] init];
            [bikeSpot setBikeID:idItem];
            [bikeSpot setBikeName:name];
            [bikeSpot setBikeAddress:address];
            [bikeSpot setBikeLocationCoordinate:listingLocation];
            [allItems addObject:bikeSpot];
            
        }
        
    }
    
    return self;
}

+(BRLBikeSpotStorage *)sharedStorage {
    static BRLBikeSpotStorage *sharedStorage = nil;
    if (!sharedStorage)
        sharedStorage = [[super allocWithZone:nil] init];
    
    return sharedStorage;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self sharedStorage];
}

-(NSMutableArray *)allItems {
    return allItems;
}

-(void)dealloc {
    allItems = nil;
}

@end
