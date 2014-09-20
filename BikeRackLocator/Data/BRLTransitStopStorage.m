//
//  BRLTransitStopStorage.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLTransitStopStorage.h"
#import "BRLTransitStop.h"
#import <CoreLocation/CoreLocation.h>

@implementation BRLTransitStopStorage{
    NSMutableArray *allItems;
    NSMutableArray *locationTitles;
}


- (id)init
{
    if (self = [super init]) {
        NSString *defaultSettingsPath = [[NSBundle mainBundle] pathForResource:@"transitStop" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:defaultSettingsPath];
        
        NSError *myError = nil;
        
        NSArray *items = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&myError];
        
        for (NSDictionary *item in items) {
            int idItem = [[item objectForKey:@"id"] intValue];
            NSString *name = [item objectForKey:@"name"];
            NSString *type = [item objectForKey:@"type"];
            NSString *address = [item objectForKey:@"address"];
            
            NSMutableDictionary *location = [item objectForKey:@"location"];
            NSNumber *lon = [NSNumber numberWithDouble:[[location objectForKey:@"lon"] doubleValue]];
            NSNumber *lat = [NSNumber numberWithDouble:[[location objectForKey:@"lat"] doubleValue]];
            CLLocation *listingLocation = [[CLLocation alloc] initWithLatitude:[lat doubleValue] longitude:[lon doubleValue]];

            
            BRLTransitStop *transitStop = [[BRLTransitStop alloc] init];
            [transitStop setStopID:idItem];
            [transitStop setStopName:name];
            [transitStop setStopType:type];
            [transitStop setStopTransitType:[type isEqualToString:@"CALTRAIN" ] ? BRLTransitType_CALTRAIN : BRLTransitType_BART];
            [transitStop setStopAddress:address];
            [transitStop setLocationCoordinate:listingLocation];
            [allItems addObject:transitStop];
            
        }
        
        locationTitles = [[NSMutableArray alloc] init];
        for (BRLTransitStop *transitStop in allItems) {
            [locationTitles addObject:transitStop.stopName];
        }
    }
    
    return self;
}

+(BRLTransitStopStorage *)sharedStorage {
    static BRLTransitStopStorage *sharedStorage = nil;
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

-(NSArray *)locationTitlesList {
    return locationTitles;
}

@end
