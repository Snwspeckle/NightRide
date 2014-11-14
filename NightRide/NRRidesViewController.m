//
//  NRRidesViewController.m
//  NightRide
//
//  Created by Anthony on 2/13/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRRidesViewController.h"
#import "NRConfirmRideTableViewController.h"

@interface NRRidesViewController ()

@end

@implementation NRRidesViewController {
    CLLocationManager *locationManager;
    NSString *centerLocation;
}
@synthesize mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(5, 385, 310, 66);
    [button setBackgroundColor:[UIColor colorWithRed:189.0/255.0 green:27.0/255.0 blue:27.0/255.0 alpha:1]];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"REQUEST A RIDE" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnConfirmRide:) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:button];
     */
    
    locationManager = [[CLLocationManager alloc] init];
    mapView.delegate = self;
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// Launches the ConfirmRideViewController when button pressed
- (IBAction)btnConfirmRide:(id)sender {
    
    NRConfirmRideTableViewController *confirmRideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfirmRideViewController"];
    confirmRideViewController.centerLocation = centerLocation;
    [self.navigationController pushViewController:confirmRideViewController animated:YES];

}

- (IBAction)btnGetLocation:(id)sender {
    [locationManager startUpdatingLocation];
}

// Tells the mapView delegate that the users location was updated
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
}

// Tells the locationManager delegate that the users location could not be updated
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

// Tells the locationManager delegate that a new location is available
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        // Zooms in when the user clicks the "Request a Ride" button
        [self.mapView setRegion:MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(0.015, 0.015)) animated:YES];
        
    }
    
    [locationManager stopUpdatingLocation];
}

// Tells the mapView delegate that the region displayed by the mapView has changed
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    centerLocation = [NSString stringWithFormat:@"%f, %f", self.mapView.centerCoordinate.latitude, self.mapView.centerCoordinate.longitude];
    NSLog(@"CENTER LOCATION %@", centerLocation);
}

@end
