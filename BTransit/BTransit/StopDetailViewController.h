//
//  StopDetailViewController.h
//  BTransit
//
//  Created by Arth Joshi on 3/16/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"
#import "Stop.h"
#import "Favorites.h"
#import "FavoritesTableViewController.h"

@interface StopDetailViewController : UIViewController

@property (strong, nonatomic) Route *selectedRoute;
@property (strong, nonatomic) Stop *selectedStop;
@property (strong, nonatomic) Favorites *favs;
@property (weak, nonatomic) IBOutlet UILabel *stopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalTimeLabel;
- (IBAction)addFavorite:(id)sender;

@end
