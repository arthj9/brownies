//
//  MapViewAnnotation.m
//  BTransit
//
//  Created by Arth Joshi on 3/4/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
//	[super init];
	title = ttl;
	coordinate = c2d;
	return self;
}

- (void)dealloc {
//	[title release];
//	[super dealloc];
}

@end
