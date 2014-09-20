//
//  BRLTransitStopStorage.h
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRLTransitStopStorage : NSObject

+ (BRLTransitStopStorage *)sharedStorage;
- (NSArray *)locationTitlesList;
- (NSMutableArray *)allItems;


@end
