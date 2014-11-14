//
//  NRAppDelegate.m
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRAppDelegate.h"
#import "NRLoginViewController.h"
#import "NRTabBarViewController.h"

@implementation NRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"LAUNCHED %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"hasBeenLaunched"]);
    // Checks if the app has been launched before, if not, sets default values
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasBeenLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasBeenLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedIn"];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NRTabBarViewController *tabBarViewController = [storyboard instantiateInitialViewController];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];
    
    // Checks if the user is NOT currently logged in, doing so will present the LoginViewController
    NSLog(@"LOGGED IN STATUS %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"isLoggedIn"]);
    /*if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isLoggedIn"]) {
        NSLog(@"IS LOGGED IN IS FALSE, PRESENT LOGIN FORM");
        
        NRLoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [loginViewController setModalPresentationStyle:UIModalPresentationFullScreen];
        [tabBarViewController presentViewController:loginViewController animated:NO completion:nil];
    }*/
    
    // Customization
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:189.0/255.0 green:27.0/255.0 blue:27.0/255.0 alpha:1]];
    NSDictionary *navTitle = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil, nil, nil, nil, nil];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:navTitle];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
