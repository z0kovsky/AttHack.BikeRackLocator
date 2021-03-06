//
//  BRLMapViewController.h
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface BRLMapViewController : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate>

- (void)setTransitStops:(NSMutableArray*)transitStops;

@end
