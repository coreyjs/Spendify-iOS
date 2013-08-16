//
//  AboutViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/18/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *fistInst;
@property (weak, nonatomic) IBOutlet UILabel *secondInst;
@property (weak, nonatomic) IBOutlet UILabel *thirdInst;
@property (weak, nonatomic) IBOutlet UILabel *fourthInst;
@property (weak, nonatomic) IBOutlet UILabel *aboutCorey;
@property (weak, nonatomic) IBOutlet UILabel *aboutMike;

-(IBAction)closeView:(id)sender;

@end
