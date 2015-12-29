//
//  Venue.h
//  CoffeeKit
//
//  Created by Sijia Davis on 11/19/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Location;
@class Stats;

@interface Venue : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) Stats    *stats;

@end
