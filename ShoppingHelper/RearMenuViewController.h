//
//  RearMenuViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/16/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RearMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *rearTable;

@end
