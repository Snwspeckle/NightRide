//
//  NRRegisterViewController.m
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRRegisterViewController.h"
#import "NRMD5Hashing.h"
#import "NetworkingManager.h"
#define salt @"FSF^D&*FH#RJNF@!$JH#@$"

@interface NRRegisterViewController ()

@end

@implementation NRRegisterViewController
@synthesize txtFirstName, txtLastName, txtEmail, txtPassword, txtConfirmPassword;

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnRegister:(id)sender {
    NSString *firstName = [txtFirstName text];
	NSString *lastName = [txtLastName text];
    NSString *email = [txtEmail text];
    NSString *password = [txtPassword text];
    NSString *confirmPassword = [txtConfirmPassword text];
    NSString *type = @"register";
	
	
	if ([firstName isEqualToString:@""] || [lastName isEqualToString:@""] || [email isEqualToString:@""] || [password isEqualToString:@""] || [confirmPassword isEqualToString:@""]) {
		
		UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error During Registration" message:@"All fields are required" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[loginAlert show];
		return;
	}
	
	if (![password isEqualToString:confirmPassword]) {
		
		UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error During Registration" message:@"Both passwords must match" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[loginAlert show];
		return;
	}
	
    // Hashing Algorithm
    NSString *saltPassword = [password stringByAppendingString:salt];
    NSString *passwordMD5 = [NRMD5Hashing md5:saltPassword];
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							firstName, @"firstName",
							lastName, @"lastName",
							passwordMD5, @"passwordMD5",
							email, @"email",
							type, @"type",
							nil];
	
	NSLog(@"Params: %@", params);
	
	[NetworkingManager sendDictionary:params responseHandler:self];
}

#pragma mark - NetworkingResponseHandler Protocol Methods

- (void)networkingResponseReceived:(id)response ForMessage:(NSDictionary *)message {
    
	if ([[message objectForKey:@"type"] isEqualToString:@"register"]) {
		
		NSLog(@"Email: %@", [response valueForKeyPath:@"email"]);
		NSLog(@"Status: %@", [response valueForKeyPath:@"status"]);
		
		if ([[response objectForKey:@"status"] isEqualToString:@"Registration Passed"]) {
			
			NSString *type = @"login";
			NSString *email = [response objectForKey:@"email"];
			
			NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
									email, @"email",
									type, @"type",
									nil];
			[NetworkingManager sendDictionary:params responseHandler:self];
		}
		else {
			UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error During Registration" message:@"Please confirm all fields are filled out correctly" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
			
			[loginAlert show];
		}
	}
	else if ([[message objectForKey:@"type"] isEqualToString:@"login"]) {
		
		NSLog(@"UserID: %@", [response valueForKeyPath:@"userID"]);
		NSLog(@"Message: %@", [response valueForKeyPath:@"message"]);
		
		if ([[response objectForKey:@"message"] isEqualToString:@"Success"]) {
			
			[(UITabBarController *)self.presentingViewController.presentingViewController setSelectedIndex:0];
			[[[(UITabBarController *)self.presentingViewController.presentingViewController viewControllers] objectAtIndex:0] popToRootViewControllerAnimated:NO];
			[self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
		}
		else {
			UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error During Registration" message:@"Server denied login" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
			
			[loginAlert show];
		}
	}
}

- (void)networkingResponseFailedForMessage:(NSDictionary *)message error:(NSError *)error {
	
	UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Error During Registration" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[loginAlert show];
	
	NSLog(@"Error with request");
	NSLog(@"%@", [error localizedDescription]);
}
@end
