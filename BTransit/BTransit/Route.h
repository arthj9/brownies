//
//  Route.h
//  BTransit
//
//  Created by Arth Joshi on 3/15/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stop.h"

@interface Route : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *stops;
- (id)initWithName: (NSString *) routeName;
- (id)init;


@end
