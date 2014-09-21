//
//  StationNameTableViewController.m
//  BikeRackLocator
//
//  Created by Laura Kirby on 9/20/14.
//  Copyright (c) 2014 com.atthack. All rights reserved.
//

#import "StationNameTableViewController.h"
#import "BRLTransitStopStorage.h"
#import "BRLMapViewController.h"

@interface StationNameTableViewController ()

@end

@implementation StationNameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[[BRLTransitStopStorage sharedStorage] locationTitlesList] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier  forIndexPath:indexPath];
    UITableViewCell *cell;
    if (cell==nil) {
        cell = [[UITableViewCell alloc] init]; 
    }
    
    // Configure the cell...
//    BRLTransitStopStorage *locations = [self.locationTitlesList objectAtIndex: indexPath.row];
//    cell.textLabel.text = locations.name; 
  
    cell.textLabel.text = [[[BRLTransitStopStorage sharedStorage] locationTitlesList] objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor redColor];
  
    return cell;
}

- (void) tableView: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BRLMapViewController *mapController = [[BRLMapViewController alloc] init];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:[[[BRLTransitStopStorage sharedStorage] allItems] objectAtIndex:BRL_PA_STATION_INDEX]];
    [mapController setTransitStops: array];
//    [[self navigationController] pushViewController:mapController animated:YES];
    [self presentViewController:mapController animated:NO completion:nil];
}

    
    
    
//    cell.textLabel.text = locationTitlesList.name;
//    cell.backgroundColor = [UIColor clearColor];
    
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
