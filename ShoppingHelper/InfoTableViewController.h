//
//  InfoTableViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/18/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

-(IBAction)closeView:(id)sender;

@end
