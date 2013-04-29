//
//  FavoritesTableViewController.h
//  BTransit
//
//  Created by Arth Joshi on 3/16/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorites.h"
#import "Stop.h"

@interface FavoritesTableViewController : UITableViewController

@property (strong, nonatomic) Favorites *favorites;

@end
