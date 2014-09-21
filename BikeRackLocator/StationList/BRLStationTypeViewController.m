//
//  BRLStationTypeViewController.m
//  BikeRackLocator
//
//  Created by Elena Pychenkova on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "BRLStationTypeViewController.h"
#import "BRLMapViewController.h"
#import "StationNameTableViewController.h"
#import "BRLTransitStopStorage.h"


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

- (IBAction)caltrainAction:(id)sender
{
    StationNameTableViewController *caltrainStations = [[StationNameTableViewController alloc] init];
    [self presentViewController: caltrainStations animated:NO completion:nil];
    
//    BRLMapViewController *mapController = [[BRLMapViewController alloc] init];
//    [mapController setTransitStops:transitStopsList];
    
//    [self presentViewController:caltrainStations animated:NO completion:nil];
}

- (IBAction)bartAction:(id)sender {
    
}

@end
