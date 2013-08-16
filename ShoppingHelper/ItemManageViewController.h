//
//  ItemManageViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/12/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "SpendifyTableViewDelegate.h"
#import "SpendifyItemDatasourceDelegate.h"

@interface ItemManageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SpendifyTableViewDelegate, SpendifyItemDatasourceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet ADBannerView *adView;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

-(IBAction)clearPriceItems:(id)sender;

@end
