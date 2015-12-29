//
//  Location.h
//  CoffeeKit
//
//  Created by Sijia Davis on 11/19/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Location;
@interface Location : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *crossStreet;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *lng;

@end
