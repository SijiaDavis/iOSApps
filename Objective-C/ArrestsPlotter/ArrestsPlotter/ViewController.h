//
//  ViewController.h
//  ArrestsPlotter
//
//  Created by Sijia Davis on 11/18/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView         *mapView;
@property (nonatomic, retain)        CLLocationManager *locationManager;

- (IBAction)refreshTapped:(id)sender;

@end

