//
//  NRSettingsTableViewController.h
//  NightRide
//
//  Created by Anthony on 1/27/14.
//  Copyright (c) 2014 NightRide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRSettingsTableViewController : UITableViewController <UIActionSheetDelegate>
@property (nonatomic, strong) IBOutlet UITableViewCell *logoutCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *callNightRideCell;


@end
