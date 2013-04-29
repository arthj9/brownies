//
//  Favorites.m
//  BTransit
//
//  Created by Arth Joshi on 3/16/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "Favorites.h"

@implementation Favorites
@synthesize stops;
- (id)init
{
    self = [super init];
    if (self) {
        stops = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
