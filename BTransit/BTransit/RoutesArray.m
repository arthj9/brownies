//
//  RoutesArray.m
//  BTransit
//
//  Created by Arth Joshi on 3/13/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "RoutesArray.h"
#import "Route.h"

@implementation RoutesArray

@synthesize routes;

- (RoutesArray *)init
{
    self = [super init];
    if (self) {
        
        NSString *title = @"routes";
        NSString *type = @"txt";
        NSString *separation = @"\n";
        NSString *fileText = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:title ofType:type] encoding:NSMacOSRomanStringEncoding error:nil];
        NSArray *routesNames= [[NSArray alloc] initWithArray:[fileText componentsSeparatedByString:separation]];
        routes = [[NSMutableArray alloc] init];
        
        for(NSString *s in routesNames){
            Route *r = [[Route alloc] initWithName:s];
            [routes addObject:r];
        }
        
    }
    return self;
    
}
@end
