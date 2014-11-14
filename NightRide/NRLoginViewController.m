//
//  NRLoginViewController.m
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRLoginViewController.h"
#import "NRTabBarViewController.h"
#import "NRRegisterViewController.h"
#import "NRAppDelegate.h"
#import "NRMD5Hashing.h"

@interface NRLoginViewController ()

@end

@implementation NRLoginViewController
@synthesize txtUsername, txtPassword;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    
    NSString *username = [txtUsername text];
    NSString *password = [txtPassword text];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            username, @"username",
                            password, @"password",
                            nil];
    NSLog(@"PARAMS %@", params);
    
    [NetworkingManager sendDictionary:params responseHandler:self];

}

- (IBAction)btnRegister:(id)sender {
    
}

- (void)networkingResponseReceived:(id)response ForMessage:(NSDictionary *)message {
	
	NSLog(@"Username: %@", [response valueForKeyPath:@"username"]);
	NSLog(@"Error: %@", [response valueForKeyPath:@"error"]);
	
    NSNumber *errorNumber = (NSNumber *)[response valueForKeyPath:@"error"];
	if ([errorNumber boolValue] == FALSE) {
        
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedIn"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        txtUsername.text = @"";
        txtPassword.text = @"";
        
	} else {
		UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error Logging In" message:@"Invalid email or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[loginAlert show];
	}
}

- (void)networkingResponseFailedForMessage:(NSDictionary *)message error:(NSError *)error {
    
	UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error Loading Game Data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[loginAlert show];
    
	NSLog(@"Error with request");
	NSLog(@"%@", [error localizedDescription]);
}
@end
