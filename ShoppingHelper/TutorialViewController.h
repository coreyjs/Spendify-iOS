//
//  TutorialViewController.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 2/6/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

-(IBAction)closeView:(id)sender;

@end
