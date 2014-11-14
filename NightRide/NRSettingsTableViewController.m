//
//  NRSettingsTableViewController.m
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import "NRSettingsTableViewController.h"
#import "NRLoginViewController.h"
#import "NRTabBarViewController.h"

@interface NRSettingsTableViewController ()

@end

@implementation NRSettingsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    NRTabBarViewController *tab = (NRTabBarViewController *)self.tabBarController;
    [tab setSelectedIndex:0];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cellClicked == _logoutCell) {
        UIActionSheet *logoutActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Logout" otherButtonTitles:nil, nil];
        logoutActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [logoutActionSheet showInView:self.view];
    } else if (cellClicked == _callNightRideCell) {
        NSURL *phoneURLNightRide = [NSURL URLWithString:@"telprompt://513-5567433"];
        [[UIApplication sharedApplication] openURL:phoneURLNightRide];
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        {case 0:
            
            // Goes back to the LoginViewController
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
            UIStoryboard *mainstoryboard = self.storyboard;
            NRLoginViewController *loginViewController = [mainstoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self presentViewController:loginViewController animated:YES completion:nil];
            break;}
            
        {case 1:
            [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
            break;}
    }
}
@end
