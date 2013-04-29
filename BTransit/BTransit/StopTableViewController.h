//
//  StopTableViewController.h
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"
#import "Stop.h"
#import "StopDetailViewController.h"

@interface StopTableViewController : UITableViewController


@property (strong, nonatomic) Route *selectedRoute;
//@property (strong, nonatomic) NSMutableArray *stops;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
