//
//  NRTabBarViewController.m
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRTabBarViewController.h"

@interface NRTabBarViewController ()

@end

@implementation NRTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UITabBar appearance] setTintColor: [UIColor colorWithRed:189.0/255.0 green:27.0/255.0 blue:27.0/255.0 alpha:1]];
    //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
