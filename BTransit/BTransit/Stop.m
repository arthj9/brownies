//
//  Stop.m
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import "Stop.h"


@implementation Stop
@synthesize name, time, parser, feeds, item, routeShortName, stopName, adjustedDepartureTimes, tripNotes, element, arrivalTime;

- (id)init
{
    self = [super init];
    if (self) {
        name = [[NSString alloc] initWithFormat:@" "];
        
        NSString *dateStr = [[NSString alloc] initWithFormat:@"Fri, 15 Mar 2013 12:53:58 +0000"];
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
        time = [[NSDate alloc] init];
        time = [dateFormat dateFromString:dateStr];

    }
    return self;
}

- (id)initWithName:(NSString *) title
       arrivalTime: (NSString *) arrival
{
    self = [super init];
    if (self) {

        
        NSString *dateStr = [[NSString alloc] initWithString: arrival];
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
        time = [[NSDate alloc] init];
        time = [dateFormat dateFromString:dateStr];
        
        
        
        feeds = [[NSMutableArray alloc] init];
        NSURL *url = [NSURL URLWithString:@"http://www.bt4u.org/webservices/BT4U_WebService.asmx/GetNextDepartures?routeShortName=hxp&stopCode=1101"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
        
        
    }
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"NextDepartures"]) {
        NSLog(@"Next Departure Found");
        item = [[NSMutableDictionary alloc] init];
        routeShortName = [[NSMutableString alloc] init];
        stopName = [[NSMutableString alloc] init];
        adjustedDepartureTimes = [[NSMutableString alloc] init];
        tripNotes = [[NSMutableString alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {


    if ([element isEqualToString:@"RouteShortName"]) {
        [routeShortName appendString:string];
    }
    else if ([element isEqualToString:@"StopName"]) {
        [stopName appendString:string];
    }
    else if ([element isEqualToString:@"AdjustedDepartureTime"]) {
        [adjustedDepartureTimes appendString:string];
    }
    else if ([element isEqualToString:@"TripNotes"]) {
        [tripNotes appendString:string];
    }

    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"DocumentElement"]){
        //Reached end of XML document
        return;
    }
    if ([elementName isEqualToString:@"NextDepartures"]) {
        //Next Departure
        [item setObject:routeShortName forKey:@"RouteShortName"];
        [item setObject:stopName forKey:@"StopName"];
        [item setObject:adjustedDepartureTimes forKey:@"AdjustedDepartureTime"];
        [item setObject:tripNotes forKey:@"TripNotes"];
        
        [feeds addObject:[item copy]];
        NSLog(@"%@", stopName);
        NSLog(@"%@", adjustedDepartureTimes);
        name = stopName;
        
        arrivalTime = adjustedDepartureTimes;

    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
//    name = stopName;
//    NSLog(@"%@", stopName);

    
}
@end
