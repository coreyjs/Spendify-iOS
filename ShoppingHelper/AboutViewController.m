//
//  AboutViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/18/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "AboutViewController.h"
#import "ColorPicker.h"
#import "DataModel.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    DataModel *m = [DataModel sharedInstance];
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
    //[self.backButton.titleLabel setFont:[UIFont fontWithName:@"PoplarStd" size:50]];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    self.view.backgroundColor = [m currentColorScheme].backgroundColor;
    
    self.description.textColor = [m currentColorScheme].buttonColor;
    self.fistInst.textColor = [m currentColorScheme].buttonColor;
    self.secondInst.textColor = [m currentColorScheme].buttonColor;
    self.thirdInst.textColor = [m currentColorScheme].buttonColor;
    self.fourthInst.textColor = [m currentColorScheme].buttonColor;
    self.aboutCorey.textColor = [m currentColorScheme].buttonColor;
    self.aboutMike.textColor = [m currentColorScheme].buttonColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeView:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
