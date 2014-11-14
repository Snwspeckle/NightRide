//
//  NRLoginViewController.h
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkingManager.h"

@interface NRLoginViewController : UIViewController <NetworkingResponseHandler>
- (IBAction)btnLogin:(id)sender;
- (IBAction)btnRegister:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end
