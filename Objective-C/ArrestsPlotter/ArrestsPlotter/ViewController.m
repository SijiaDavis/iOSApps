//
//  ViewController.m
//  ArrestsPlotter
//
//  Created by Sijia Davis on 11/18/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "Logs.h"
#import "MyLocation.h"

#define METERS_PER_MILE 1609.344

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    DLog(@"-> Begin");
    
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    DLog(@"-> End");
}

- (void)viewWillAppear:(BOOL)animated
{
    DLog(@"-> Begin");
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude         = 39.281516;
    zoomLocation.longitude        = -76.580806;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [_mapView setRegion:viewRegion animated:YES];
    
    DLog(@"-> End");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshTapped:(id)sender
{
    DLog(@"-> Begin");
    
    // Set the longitute and latitude for the center of the map.
    MKCoordinateRegion     mapRegion      = [_mapView region];
    CLLocationCoordinate2D centerLocation = mapRegion.center;
    
    // Read in the query string from the json file.
    NSString *jsonFile     = [[NSBundle mainBundle] pathForResource:@"command"
                                                             ofType:@"json"];
    NSString *formatString = [NSString stringWithContentsOfFile:jsonFile encoding:NSUTF8StringEncoding error:nil];
    
    NSString *json         = [NSString stringWithFormat:formatString, centerLocation.latitude, centerLocation.longitude, 0.5*METERS_PER_MILE];
   
    // Create a url for the webservice endpoint to query.
    NSURL    *url          = [NSURL URLWithString:@"http://vip46.groupehn.com:20003/ressources/data.json"];
    
    // Create a ASIHTTPRequest and set it up as a POST request. Passing the json string as data.
    ASIHTTPRequest *_request       = [ASIHTTPRequest requestWithURL:url];
    __weak ASIHTTPRequest *request = _request;
    request.requestMethod          = @"POST";
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
   
    
    // Set up the blocks for the completion and failure.
    [request setDelegate:self];
    [request setCompletionBlock:^{
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSLog(@"request done");
        
        NSString *responseString = [request responseString];
        NSLog(@"Response is: %@", responseString);
        
        [self plotCrimePositions:request.responseData];
    }];


    [request setFailedBlock:^{
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSError *error = [request error];
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    // starts the request going asynchronously.
    [request startAsynchronous];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading... >_<";
    
    DLog(@"-> End");
}

- (void)plotCrimePositions:(NSData *)responseData
{
    DLog(@"-> Begin");
    
    for (id<MKAnnotation> annotation in _mapView.annotations)
    {
        [_mapView removeAnnotation:annotation];
    }
    
    NSDictionary *root = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSArray *data      = [root objectForKey:@"data"];
    
    for (NSArray *row in data)
    {
        NSString *crimeDescription = [ NSString stringWithFormat:@"%@", [row objectAtIndex:12] ];
        NSString *address          = [ NSString stringWithFormat:@"%@", [row objectAtIndex:16] ];
        NSString *latitude         = [ NSString stringWithFormat:@"%@", [[row objectAtIndex:17]objectAtIndex:1]];
        NSString *longitude        = [ NSString stringWithFormat:@"%@", [[row objectAtIndex:17]objectAtIndex:2]];
        
        DLog(@"crimeDescription :%@", crimeDescription);
        DLog(@"address :%@", address);
        DLog(@"latitude :%@", latitude);
        DLog(@"longitude :%@", longitude);
        
        if (![latitude  isEqual: @"<null>"] && ![longitude  isEqual: @"<null>"])
        {
        NSNumber *latitude         = [[row objectAtIndex:17]objectAtIndex:1];
        NSNumber *longitude        = [[row objectAtIndex:17]objectAtIndex:2];
        CLLocationCoordinate2D coordinate;
        coordinate.latitude        = latitude.doubleValue;
        coordinate.longitude       = longitude.doubleValue;
            
            if ([address  isEqual: @"<null>"]) {
                address          = @"N/A";
            }
            
            if ([crimeDescription  isEqual: @"<null>"]){
                crimeDescription = @"No Info";
            }
            
        MyLocation *annotation   = [[MyLocation alloc] initWithName:crimeDescription address:address coordinate:coordinate];
        [_mapView addAnnotation:annotation];
        }
    }
    
    DLog(@"-> End");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    DLog(@"-> Begin");
    
    static NSString *identifier = @"MyLocation";
    
    if ([annotation isKindOfClass:[MyLocation class]])
    {
        MKAnnotationView *annotationView = (MKAnnotationView *)
        [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"arrest.png"];
        }
        
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
    
     DLog(@"-> End");
}

- (void)mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    MyLocation *location = (MyLocation*)view.annotation;
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [location.mapItem openInMapsWithLaunchOptions:launchOptions];
}

@end
