//
//  MyLocation.h
//  BTransit
//
//  Created by Arth Joshi on 3/5/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
