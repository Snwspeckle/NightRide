//
//  NRRidesViewController.h
//  NightRide
//
//  Created by Anthony on 2/13/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface NRRidesViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)btnGetLocation:(id)sender;

@end
