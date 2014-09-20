//
//  BRLStationTypeViewController.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLStationTypeViewController.h"
#import "BRLMapViewController.h"
@interface BRLStationTypeViewController ()

@end

@implementation BRLStationTypeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)caltrainAction:(id)sender {
    BRLMapViewController *mapController = [[BRLMapViewController alloc] init];
    
    [self presentViewController:mapController animated:NO completion:nil];

}

@end
