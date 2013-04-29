//
//  StopTableViewController.m
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "StopTableViewController.h"

@interface StopTableViewController ()

@end

@implementation StopTableViewController
@synthesize selectedRoute, searchResults;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    searchResults = [[NSMutableArray alloc] initWithCapacity:[selectedRoute.stops count]];
    [self setTitle:[selectedRoute name]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    //    NSPredicate *resultPredicate = [NSPredicate
    //                                    predicateWithFormat:@"SELF contains[cd] %@",
    //                                    searchText];
    //
    //    searchResults = [[NSArray alloc] init];
    //    NSMutableArray *routesString = [[NSMutableArray alloc] init];
    //
    //    for(Route *r in [routesList routes]){
    //        NSString *string = r.name;
    //        [routesString addObject:string];
    //    }
    //    searchResults = [routesString filteredArrayUsingPredicate:resultPredicate];
    
    [searchResults removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    searchResults = [NSMutableArray arrayWithArray:[selectedRoute.stops filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [selectedRoute.stops count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Stop";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//    NSLog(@"arrayforstops: %@", [selectedRoute.stops description]);
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        Stop *s = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = s.name;
    } else {
        Stop *s = [selectedRoute.stops objectAtIndex:indexPath.row];
        cell.textLabel.text = s.name;
    }
    
    return cell;


}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showStopDetail"]) {
        
        StopDetailViewController *sdvc =[segue destinationViewController];
        
        if (self.searchDisplayController.active) {
            NSIndexPath *path = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            Stop *s = [searchResults objectAtIndex:[path row]];
//            NSLog(@"search:%@", [s description]);
            [sdvc setSelectedRoute:selectedRoute];
            [sdvc setSelectedStop:s];
        }
        else {
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            Stop *s = [selectedRoute.stops objectAtIndex:[path row]];
//            NSLog(@"search:%@", [s description]);
            [sdvc setSelectedRoute:selectedRoute];
            [sdvc setSelectedStop:s];
        }
    }
    
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier: @"showStopDetail" sender: self];
    }
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
