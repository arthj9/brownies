//
//  RoutesListViewController.h
//  BTransit
//
//  Created by Arth Joshi on 3/13/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutesArray.h"
#import "StopTableViewController.h"
#import "Favorites.h"


@interface RoutesTableViewController : UITableViewController

@property (strong, nonatomic) RoutesArray *routesList;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
