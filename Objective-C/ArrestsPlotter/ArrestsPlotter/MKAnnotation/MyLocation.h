//
//  MyLocation.h
//  ArrestsPlotter
//
//  Created by Sijia Davis on 11/18/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString *)name address:(NSString *)address coordinate:(CLLocationCoordinate2D)coordinate;

- (MKMapItem *)mapItem;

@end
