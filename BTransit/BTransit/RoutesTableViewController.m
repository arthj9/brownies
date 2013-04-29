//
//  RoutesListViewController.m
//  BTransit
//
//  Created by Arth Joshi on 3/13/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "RoutesTableViewController.h"

@interface RoutesTableViewController ()

@end

@implementation RoutesTableViewController


@synthesize routesList, searchResults, searchBar;


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

    
    routesList = [[RoutesArray alloc] init];
    searchResults = [[NSMutableArray alloc] initWithCapacity:[[routesList routes] count]];

    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//
//    // Return the number of rows in the section.
//    return [[routesList routes] count];
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Route";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//        
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    NSString *currentRouteName = [[routesList routes] objectAtIndex:[indexPath row]];
//    [cell.textLabel setText:currentRouteName];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    // Configure the cell...
//    
//    return cell;
//}

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
    searchResults = [NSMutableArray arrayWithArray:[[routesList routes] filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [[routesList routes] count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Route";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        Route *route = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = route.name;
    } else {
        Route *route = [[routesList routes] objectAtIndex:indexPath.row];
        cell.textLabel.text = route.name;
    }
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showStopList"]) {
        
        StopTableViewController *stvc =[segue destinationViewController];
        
        if (self.searchDisplayController.active) {
            NSIndexPath *path = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            Route *r = [searchResults objectAtIndex:[path row]];
//            NSLog(@"search:%@", [r description]);
            [stvc setSelectedRoute:r];
        }
        else {
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            Route *r = [[routesList routes] objectAtIndex:[path row]];
//            NSLog(@"search:%@", [r description]);
            [stvc setSelectedRoute:r];
        }
    }


}



// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

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
        [self performSegueWithIdentifier: @"showStopList" sender: self];
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
