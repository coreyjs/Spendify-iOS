//
//  ItemInputViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "ItemInputViewController.h"
#import "DataModel.h"
#import "ItemData.h"
#import "ColorPicker.h"

@interface ItemInputViewController (){
    
    NSNumberFormatter *_priceFormatter;
}



@end

@implementation ItemInputViewController

@synthesize oneButton = _oneButton;
@synthesize twoButton = _twoButton;
@synthesize threeButton = _threeButton;
@synthesize fourButton = _fourButton;
@synthesize fiveButton = _fiveButton;
@synthesize sixButton = _sixButton;
@synthesize sevenButton = _sevenButton;
@synthesize eightButton = _eightButton;
@synthesize nineButton = _nineButton;
@synthesize zeroButton = _zeroButton;
@synthesize radixButton = _radixButton;
@synthesize backButton = _backButton;
@synthesize quantiyField = _quantiyField;
@synthesize priceField = _priceField;
@synthesize addButton = _addButton;
@synthesize timesLabel = _timesLabel;

// Obsolete properties
@synthesize incrementButton = _incrementButton;
@synthesize decrementButton = _decrementButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

-(BOOL) canBecomeFirstResponder{
    /* Here, We want our view (not viewcontroller) as first responder
     to receive shake event message  */
    
    return YES;
}

#define FONT @"System"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self becomeFirstResponder];
    
    DataModel *m = [DataModel sharedInstance];
    
    self.quantiyField.text = @"1";
    NSLog(@"Inside viewDidLoad");
    
    // Swipe up to incress quantity
    UISwipeGestureRecognizer *_gestureSwipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(incrementField:)];
    _gestureSwipeUp.numberOfTouchesRequired = 1;
    _gestureSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:_gestureSwipeUp];
    
    UISwipeGestureRecognizer *_gestureSwipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(decrementField:)];
    _gestureSwipeDown.numberOfTouchesRequired = 1;
    _gestureSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:_gestureSwipeDown];
   
//    UISwipeGestureRecognizer *_swipeViewRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
//    _swipeViewRight.numberOfTouchesRequired = 1;
//    _swipeViewRight.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.navigationController.view addGestureRecognizer:_swipeViewRight];
    
    // We need to create lable here and center on each button
    [self.oneButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.oneButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    [self.oneButton.titleLabel setTextColor:[m currentColorScheme].buttonText];
    //self.oneButton.titleLabel.highlightedTextColor = [m currentColorScheme].buttonText;
    [self.oneButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.oneButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Two Button
    [self.twoButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.twoButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    
    self.twoButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.twoButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.twoButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.twoButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Three Button
    [self.threeButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.threeButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.threeButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.threeButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.threeButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.threeButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Four Button
    [self.fourButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.fourButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.fourButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.fourButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.fourButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.fourButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
   
    // Five Button
    [self.fiveButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.fiveButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.fiveButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.fiveButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.fiveButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.fiveButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];

        
    // Six Button
    [self.sixButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.sixButton.titleLabel setFont:[UIFont systemFontOfSize:40]];;
    self.sixButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.sixButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.sixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.sixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];

    
    // Seven Button
    [self.sevenButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.sevenButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.sevenButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.sevenButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.sevenButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.sevenButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];

    
    // Eight Button
    [self.eightButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.eightButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.eightButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.eightButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.eightButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.eightButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];

        
    // Nine Button
    [self.nineButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.nineButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.nineButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.nineButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.nineButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.nineButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Radix Point Button
    [self.radixButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.radixButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.radixButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.radixButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.radixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.radixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Back Button
    [self.backButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.backButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.backButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.backButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Zero Button
    [self.zeroButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.zeroButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.zeroButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.zeroButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.zeroButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.zeroButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    self.view.backgroundColor = [m currentColorScheme].backgroundColor;
    
    [self.addButton setBackgroundColor:[m currentColorScheme].addButton];
    [self.addButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.addButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.addButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.addButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.addButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];

    
    
    [self.quantiyField setFont:[UIFont systemFontOfSize:40]];
    self.quantiyField.textColor = [m currentColorScheme].labelQuantityColor;
    
    [self.priceField setFont:[UIFont systemFontOfSize:40]];
    self.priceField.textColor = [m currentColorScheme].addButton;
    
    
    [self.timesLabel setFont:[UIFont systemFontOfSize:30]];
    self.timesLabel.textColor = [m currentColorScheme].labelQuantityColor;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"ItemInput - View Did Appear");
    [super viewDidAppear:animated];
    //[self updateViewOnChange];
    if( [[DataModel sharedInstance] colorChanged]){
        [self updateViewOnChange];
        [[DataModel sharedInstance] setColorChanged:NO];
    }
    
    if([[DataModel sharedInstance] showTutorial] == YES){
        [self performSegueWithIdentifier:@"introtutorial" sender:self];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Shake Event Handlers
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
    if(event.subtype == UIEventSubtypeMotionShake){
        [self clearFields:self];
    }
}

#pragma mark Helper Methods

-(IBAction)clearFields:(id)sender{
    self.priceField.text = @"0.00";
    self.quantiyField.text = @"1";
}

-(IBAction)appendToPrice:(id)sender{
    float _currentPrice = [self.priceField.text floatValue];
    
    if( [self.priceField.text isEqualToString:@"0.00"] ){
        self.priceField.text = @"";
    }
    
    if(self.priceField.text.length > 0){
        
        
        if( [self.priceField.text rangeOfString:@"."].length == 1){
                // contains a "." point
            if( [self.priceField.text rangeOfString:@"."].location == [self.priceField.text length] - 3){
                NSLog(@"Deciaml is 2 places already");
                return;
            }
        }
        
        
    }
    
    NSString *selectedDigit = ((UIButton*)sender).titleLabel.text;
    
    // Need to reset font color
    UIButton* senderButton = ((UIButton*)sender);
    senderButton.titleLabel.textColor = [[DataModel sharedInstance] currentColorScheme].buttonText;
    NSLog(@"Selected Button: %@", selectedDigit);
    self.priceField.text = [NSString stringWithFormat:@"%@%@", self.priceField.text, selectedDigit];
}

-(IBAction)addItemToList:(id)sender{
    
    if(self.priceField.text != nil){
        int _qty = [self.quantiyField.text intValue];
        float _price = [self.priceField.text floatValue];
        
        if(_price > 0.00f){
            ItemData* item = [[ItemData alloc] initWithName:@"" price:_price quantity:_qty];
    
            [[DataModel sharedInstance] addItemData:item];
            [self clearFields:self];
        }
       // [self.delegate addPriceItem:item];
    }
}

-(IBAction)undoPriceAddition:(id)sender{
    if([self.priceField.text length] > 0){
        self.priceField.text = [self.priceField.text substringToIndex:[self.priceField.text length] - 1];
    }
}

-(IBAction)incrementField:(id)sender{
    
   // if(self.quantiyField.isEditing){
        int _currentQuantity = [self.quantiyField.text intValue];
        _currentQuantity = _currentQuantity + 1;
        self.quantiyField.text = [NSString stringWithFormat:@"%d", _currentQuantity];
   // }
    
}

-(IBAction)decrementField:(id)sender{
    
    //if(self.quantiyField.isEditing){
        int _currentQuantity = [self.quantiyField.text intValue];
        _currentQuantity = _currentQuantity - 1;
        if(_currentQuantity <= 0){
            _currentQuantity = 1;
        }
        self.quantiyField.text = [NSString stringWithFormat:@"%d", _currentQuantity];
   // }
    
}

// This will hide the keyboard from showing up if user selects an input box
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
    
    return NO;
}

-(void)updateViewOnChange{
    
    DataModel *m = [DataModel sharedInstance];
    
    [self.oneButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.oneButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    [self.oneButton.titleLabel setTextColor:[m currentColorScheme].buttonText];
    //self.oneButton.titleLabel.highlightedTextColor = [m currentColorScheme].buttonText;
    [self.oneButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.oneButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Two Button
    [self.twoButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.twoButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    
    self.twoButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.twoButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.twoButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.twoButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Three Button
    [self.threeButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.threeButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.threeButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.threeButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.threeButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.threeButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Four Button
    [self.fourButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.fourButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.fourButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.fourButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.fourButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.fourButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Five Button
    [self.fiveButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.fiveButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.fiveButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.fiveButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.fiveButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.fiveButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Six Button
    [self.sixButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.sixButton.titleLabel setFont:[UIFont systemFontOfSize:40]];;
    self.sixButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.sixButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.sixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.sixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Seven Button
    [self.sevenButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.sevenButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.sevenButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.sevenButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.sevenButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.sevenButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Eight Button
    [self.eightButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.eightButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.eightButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.eightButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.eightButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.eightButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    // Nine Button
    [self.nineButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.nineButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.nineButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.nineButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.nineButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.nineButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Radix Point Button
    [self.radixButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.radixButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.radixButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.radixButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.radixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.radixButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Back Button
    [self.backButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.backButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.backButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.backButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    // Zero Button
    [self.zeroButton setBackgroundColor:[m currentColorScheme].buttonColor];
    [self.zeroButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.zeroButton.titleLabel.backgroundColor = [m currentColorScheme].buttonColor;
    self.zeroButton.titleLabel.textColor = [m currentColorScheme].buttonText;
    [self.zeroButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateSelected];
    [self.zeroButton setTitleColor:[m currentColorScheme].buttonText forState:UIControlStateNormal];
    
    
    self.view.backgroundColor = [m currentColorScheme].backgroundColor;
    
    [self.addButton setBackgroundColor:[m currentColorScheme].addButton];
    [self.addButton.titleLabel setFont:[UIFont systemFontOfSize:40]];
    self.addButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.addButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.addButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.addButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    
    
    [self.quantiyField setFont:[UIFont systemFontOfSize:40]];
    self.quantiyField.textColor = [m currentColorScheme].labelQuantityColor;
    
    [self.priceField setFont:[UIFont systemFontOfSize:40]];
    self.priceField.textColor = [m currentColorScheme].addButton;
    
    
    [self.timesLabel setFont:[UIFont systemFontOfSize:30]];
    self.timesLabel.textColor = [m currentColorScheme].labelQuantityColor;
}

@end





















