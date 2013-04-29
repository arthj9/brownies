//
//  FirstViewController.m
//  BTransit
//
//  Created by Arth Joshi on 2/23/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "DirectionsViewController.h"
#import <MapKit/MapKit.h>
#import "MyLocation.h"


#define METERS_PER_MILE 8000.00

@interface DirectionsViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DirectionsViewController

-(void)viewWillAppear:(BOOL)animated{
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 37.229030;
    zoomLocation.longitude= -80.422497;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*
                                                                       METERS_PER_MILE);
    
    
    [_mapView setRegion:viewRegion animated:YES];
    CLLocationCoordinate2D tester;
    tester.latitude =37.229030;
    tester.longitude = -80.422497;
    
    MyLocation *annotation = [[MyLocation alloc] initWithName:@"Stop" address:@"Stop" coordinate:tester];
    [_mapView addAnnotation:annotation];
}

@end





