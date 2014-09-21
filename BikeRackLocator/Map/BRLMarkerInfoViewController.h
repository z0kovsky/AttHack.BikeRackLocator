//
//  BRLMarkerInfoViewController.h
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRLBikeSpot.h"

@interface BRLMarkerInfoViewController : UIViewController

- (void)setBikeSpot:(BRLBikeSpot *)bikespot;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *nameTextView;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;

@end
