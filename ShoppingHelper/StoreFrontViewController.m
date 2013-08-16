//
//  StoreFrontViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "StoreFrontViewController.h"
#import "SpendifyIAPHelper.h"
#import <StoreKit/StoreKit.h>
#import "ColorPicker.h"
#import "DataModel.h"

@interface StoreFrontViewController (){
    NSNumberFormatter *_priceFormatter;
    NSArray *_products;
}

@end

@implementation StoreFrontViewController

@synthesize buyThemes = _buyThemes;
@synthesize productLabel = _productLabel;



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
    
    self.buyThemes.hidden = YES;
    self.restorePurchases.hidden = YES;
    
    _products = nil;
    [[SpendifyIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if(success){
            _products = products;
            SKProduct *product = (SKProduct *)_products[0];
            
            self.productLabel.text = product.localizedDescription;
            self.productLabel.textColor = [m currentColorScheme].addButton;
            [_priceFormatter setLocale:product.priceLocale];
            self.buyThemes.titleLabel.text = [_priceFormatter stringFromNumber:product.price];
        
            self.buyThemes.hidden = NO;
            self.restorePurchases.hidden = NO;
            
        }
    }];
    
    
    _priceFormatter = [[NSNumberFormatter alloc] init];
    [_priceFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [_priceFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.buyThemes.tag = 0;
    [self.buyThemes addTarget:self action:@selector(buyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.buyThemes setBackgroundColor:[m currentColorScheme].addButton];
    [self.buyThemes setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.buyThemes setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    [self.restorePurchases addTarget:self action:@selector(restoreTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.restorePurchases setBackgroundColor:[m currentColorScheme].addButton];
    [self.restorePurchases setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.restorePurchases setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buyButtonTapped:(id)sender {
    
    UIButton *buyButton = (UIButton *)sender;
    SKProduct *product = _products[buyButton.tag];
    
    NSLog(@"Buying %@...", product.productIdentifier);
    [[SpendifyIAPHelper sharedInstance] buyProduct:product];
    
//    if([[SpendifyIAPHelper sharedInstance] productPurchased:kThemesAndAds]){
//        [self closeView:self];
//    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)productPurchased:(NSNotification *)notification {
    
    NSString * productIdentifier = notification.object;
    [_products enumerateObjectsUsingBlock:^(SKProduct * product, NSUInteger idx, BOOL *stop) {
        if ([product.productIdentifier isEqualToString:productIdentifier]) {
//            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:idx inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
//            *stop = YES;
            self.buyThemes.hidden = YES;
            self.restorePurchases.hidden = YES;
            [self closeView:self];
            
        }
    }];
    
}

-(void)closeView:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)restoreTapped:(id)sender {
    [[SpendifyIAPHelper sharedInstance] restoreCompletedTransactions];
    
//    if([[SpendifyIAPHelper sharedInstance] productPurchased:kThemesAndAds]){
//        [self closeView:self];
//    }
}

@end
