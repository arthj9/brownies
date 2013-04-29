//
//  Favorites.h
//  BTransit
//
//  Created by Arth Joshi on 3/16/13.
//  Copyright (c) 2013 Arth Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favorites : NSObject
@property (strong, nonatomic) NSMutableArray *stops;

- (id)init;
@end
