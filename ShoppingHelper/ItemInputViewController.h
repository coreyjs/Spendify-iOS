//
//  ItemInputViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpendifyItemDatasourceDelegate.h"
#import "ZUUIRevealController.h"

@interface ItemInputViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UIButton* oneButton;
@property (nonatomic, weak) IBOutlet UIButton* twoButton;
@property (nonatomic, weak) IBOutlet UIButton* threeButton;
@property (nonatomic, weak) IBOutlet UIButton* fourButton;
@property (nonatomic, weak) IBOutlet UIButton* fiveButton;
@property (nonatomic, weak) IBOutlet UIButton* sixButton;
@property (nonatomic, weak) IBOutlet UIButton* sevenButton;
@property (nonatomic, weak) IBOutlet UIButton* eightButton;
@property (nonatomic, weak) IBOutlet UIButton* nineButton;
@property (nonatomic, weak) IBOutlet UIButton* zeroButton;
@property (nonatomic, weak) IBOutlet UIButton* radixButton;
@property (nonatomic, weak) IBOutlet UIButton* backButton;
@property (nonatomic, weak) IBOutlet UILabel* quantiyField;
@property (nonatomic, weak) IBOutlet UILabel* priceField;
@property (nonatomic, weak) IBOutlet UIButton* addButton;
@property (nonatomic, weak) IBOutlet UILabel* timesLabel;

@property (nonatomic, weak) IBOutlet UIButton* incrementButton;
@property (nonatomic, weak) IBOutlet UIButton* decrementButton;

//@property (nonatomic, assign) id<SpendifyItemDatasourceDelegate> delegate;



-(IBAction)addItemToList:(id)sender;
-(IBAction)clearFields:(id)sender;
-(IBAction)incrementField:(id)sender;
-(IBAction)decrementField:(id)sender;
-(IBAction)appendToPrice:(id)sender;
-(IBAction)undoPriceAddition:(id)sender;
-(void)updateViewOnChange;

@end
