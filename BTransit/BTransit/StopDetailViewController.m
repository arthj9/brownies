//
//  StopDetailViewController.m
//  BTransit
//
//  Created by Arth Joshi on 3/16/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "StopDetailViewController.h"

@interface StopDetailViewController ()

@end

@implementation StopDetailViewController
@synthesize selectedRoute, selectedStop,favs, stopNameLabel, routeNameLabel, arrivalTimeLabel;

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
    NSString *stopName = selectedStop.name;
    NSString *routeName = selectedRoute.name;
    [stopNameLabel setText:stopName];
    [routeNameLabel setText:routeName];
    
    
    NSDate *arrivalTime = selectedStop.time;
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm:ss"];
    NSString *arrivalTimeString = [df stringFromDate:arrivalTime];
    
    [arrivalTimeLabel setText:arrivalTimeString];
    
    [arrivalTimeLabel setText:selectedStop.arrivalTime];

    
    [self setTitle:stopName];
    

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addFavorite:(id)sender {
    
    
//    if (favs == nil){
//        favs = [[Favorites alloc] init];
//    }
//
//    [favs.stops addObject:selectedStop];
//    
//    [self performSegueWithIdentifier: @"showFavorites" sender: self];

}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showFavorites"]) {
        
        FavoritesTableViewController *ftvc =[segue destinationViewController];
        [ftvc setFavorites:favs];

    }
    
}
    
    
@end
