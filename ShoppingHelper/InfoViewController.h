//
//  InfoViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/7/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UITableViewController

@property (nonatomic, weak) IBOutlet UIBarButtonItem* backButton;
@property (weak, nonatomic) IBOutlet UITableView *staticTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *TopNavigationBar;

-(IBAction)closeModalWindow:(id)sender;
@end
