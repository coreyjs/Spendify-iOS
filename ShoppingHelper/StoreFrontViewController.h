//
//  StoreFrontViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreFrontViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buyThemes;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *restorePurchases;


-(IBAction)closeView:(id)sender;

@end
