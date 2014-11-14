//
//  NRRegisterViewController.h
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkingManager.h"

@interface NRRegisterViewController : UIViewController <NetworkingResponseHandler>
- (IBAction)btnCancel:(id)sender;
- (IBAction)btnRegister:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;

@end
