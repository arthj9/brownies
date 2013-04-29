//
//  Stop.h
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stop : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *time;
@property (strong, nonatomic) NSXMLParser *parser;
@property (strong, nonatomic) NSMutableArray *feeds;
@property (strong, nonatomic) NSMutableDictionary *item;
@property (strong, nonatomic) NSMutableString *routeShortName;
@property (strong, nonatomic) NSMutableString *stopName;
@property (strong, nonatomic) NSMutableString *adjustedDepartureTimes;
@property (strong, nonatomic) NSMutableString *tripNotes;
@property (strong, nonatomic) NSString *element;

@property (strong, nonatomic) NSString *arrivalTime;

- (id)init;

- (id)initWithName:(NSString *) title
       arrivalTime: (NSString *) arrival;
@end
