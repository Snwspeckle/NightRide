//
//  NRConfirmRideTableViewController.h
//  NightRide
//
//  Created by Anthony on 2/25/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRConfirmRideTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *textFieldPickup;
@property (strong, nonatomic) IBOutlet UITextField *textFieldDestination;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellPickup;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellDestination;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellNumberOfRiders;
@property (strong, nonatomic) IBOutlet UIStepper *stepperNumberOfRiders;

@property (nonatomic, retain) NSString *centerLocation;

@end
