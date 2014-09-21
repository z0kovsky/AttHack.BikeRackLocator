//
//  BRLMarkerInfoViewController.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLMarkerInfoViewController.h"

@interface BRLMarkerInfoViewController ()

@end

@implementation BRLMarkerInfoViewController{
    BRLBikeSpot *_bikeSpot;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (_bikeSpot) {
        self.nameTextView.text =_bikeSpot.bikeName;
        self.addressTextView.text = _bikeSpot.bikeAddress;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBikeSpot:(BRLBikeSpot *)bikespot
{
    _bikeSpot = bikespot;
}

@end
