//
//  Route.m
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "Route.h"
#import "Stop.h"

@implementation Route
@synthesize name, stops;

- (id)init
{
    self = [super init];
    if (self) {
        name = [[NSString alloc] initWithFormat: @" "];
        stops = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithName: (NSString *) routeName
{
    self = [super init];
    if (self) {
        name = [[NSString alloc] initWithString:routeName];
        stops = [[NSMutableArray alloc] init];
        NSString *fileName = [[NSString alloc] init];
        
        if ([[name description] isEqual: @"CRC Shuttle"]) {
            fileName = @"CRC Shuttle";
        }
        
        else if ([[name description] isEqual: @"CRC/Hospital"]) {
            fileName = @"CRC:Hospital";
        }
        
        else if ([[name description] isEqual: @"Hethwood"]) {
            fileName = @"Hethwood";
        }
        
        else if ([[name description] isEqual: @"Harding Ave"]) {
            fileName = @"Harding Ave";
        }

        
        else if ([[name description] isEqual: @"Hokie Express"]) {
                fileName = @"Hokie Express";
        }
        
        else if ([[name description] isEqual: @"Hospital Connector"]) {
                    fileName = @"Hospital Connector";
        }
        
        else if ([[name description] isEqual: @"Main Street North"]) {
            fileName = @"Main Street North";
        }
        
        else if ([[name description] isEqual: @"Main Street South"]) {
            fileName = @"Main Street South";
        }
        
        else if ([[name description] isEqual: @"Patrick Henry"]) {
            fileName = @"Patrick Henry";
        }
        
        else if ([[name description] isEqual: @"Progress Street"]) {
            fileName = @"Progress Street";
        }
        
        else if ([[name description] isEqual: @"Toms Creek"]) {
            fileName = @"Toms Creek";
        }
        
        else if ([[name description] isEqual: @"Two Town Trolley"]) {
            fileName = @"Two Town Trolley";
        }
        
        else if ([[name description] isEqual: @"University City Boulevard"]) {
            fileName = @"University City Boulevard";
        }
        
        else if ([[name description] isEqual: @"University Mall Shuttle"]) {
            fileName = @"University Mall Shuttle";
        }
        
        else if ([[name description] isEqual: @"Snow Routes"]) {
            fileName = @"Snow Routes";
        }
        
        else if ([[name description] isEqual: @"Game Day Service: Football"]) {
            fileName = @"Game Day Service: Football";
        }
        
        else if ([[name description] isEqual: @"Game Day Service: Basketball"]) {
            fileName = @"Game Day Service: Basketball";
        }
        
        else if ([[name description] isEqual: @"Christiansburg Service"]) {
            fileName = @"Christiansburg Service";
        }
        
        else if ([[name description] isEqual: @"BT Commuter Service"]) {
            fileName = @"BT Commuter Service";
        }

        NSString *type = @"txt";
        NSString *separation = @"\n";
        NSString *fileText = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type] encoding:NSMacOSRomanStringEncoding error:nil];
        NSArray *stopList = [[NSArray alloc] initWithArray:[fileText componentsSeparatedByString:separation]];
        
        for(NSString *s in stopList){
            Stop *stop = [[Stop alloc] initWithName:s arrivalTime:@"Fri, 15 Mar 2013 13:54:33 +0000"];
            [stops addObject:stop];
        }
        
            
        
        
    }
    return self;
}
@end