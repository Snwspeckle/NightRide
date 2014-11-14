//
//  NRConfirmRideTableViewController.m
//  NightRide
//
//  Created by Anthony on 2/25/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRConfirmRideTableViewController.h"

@interface NRConfirmRideTableViewController ()

@end

@implementation NRConfirmRideTableViewController
@synthesize textFieldPickup, textFieldDestination, cellPickup, cellDestination, cellNumberOfRiders, stepperNumberOfRiders, centerLocation;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"CONFIRM RIDE LOCATION %@",centerLocation);
    int intNumberOfRiders = stepperNumberOfRiders.value;
    textFieldPickup.text = centerLocation;
    //cellPickup.textLabel.text = centerLocation;
    cellNumberOfRiders.textLabel.text = [@(intNumberOfRiders) stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Removes the keyboard when a user touches outside of it
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textFieldPickup endEditing:YES];
    [self.textFieldDestination endEditing:YES];
}

// Updates the Number of Riders cell when the UIStepper value changes
-(IBAction)stepperValueChanged:(UIStepper *)sender
{
    NSUInteger intNumberOfRiders = sender.value;
    cellNumberOfRiders.textLabel.text = [@(intNumberOfRiders) stringValue];
}
/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}*/

@end
