//
//  ItemManageViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/12/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "ItemManageViewController.h"
#import  "DataModel.h"
#import "ItemData.h"
#import "SpendifyUITableViewCell.h"
#import "ColorPicker.h"
#import "SpendifyIAPHelper.h"

@interface ItemManageViewController ()

@end

@implementation ItemManageViewController{
    
    NSMutableArray *_priceItems;
    
    
}

@synthesize totalLabel = _totalLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _priceItems = [DataModel sharedInstance].items;
        //[_priceItems addObject:[[ItemData alloc] initWithName:@"yest" price:1.23f quantity:2]];
    }
    return self;
}

-(void)dismissView:(id)sender{
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    
    [self.navigationController popViewControllerAnimated:YES];
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataModel *m = [DataModel sharedInstance];
    
   // if( [[SpendifyIAPHelper sharedInstance] productPurchased:kThemesAndAds]){
        self.adView.hidden = YES;
   // }
    
    // Do any additional setup after loading the view from its nib.
    // Custom initialization
    NSLog(@"ItemManageViewController - viewDidLoad");
    UISwipeGestureRecognizer *_gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView:)];
    _gestureRight.numberOfTouchesRequired = 1;
    _gestureRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:_gestureRight];

    
    _priceItems = [[DataModel sharedInstance] items];
   // _priceItems = [[NSMutableArray alloc ] init];
    self.tableView.dataSource = self;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
        [self.tableView registerClass:[SpendifyUITableViewCell class] forCellReuseIdentifier:@"cell"];
    else{
        
    }
    // needed for UITableViewDelegate
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [[DataModel sharedInstance] currentColorScheme].backgroundColor;
    [self.totalLabel setBackgroundColor:[UIColor clearColor]];
    [self.totalLabel setFont:[UIFont systemFontOfSize:25]];
    self.totalLabel.textColor = [DataModel sharedInstance].currentColorScheme.buttonColor;
    self.totalLabel.text = @"0.00";
    
    [self calculateTotal];
    
    
    self.view.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonText;
    
    // clear button font
    [self.clearButton setBackgroundColor:[m currentColorScheme].buttonText];
    self.clearButton.titleLabel.textColor = [m currentColorScheme].buttonColor;
    [self.clearButton setTitleColor:[m currentColorScheme].buttonColor forState:UIControlStateSelected];
    [self.clearButton setTitleColor:[m currentColorScheme].buttonColor forState:UIControlStateNormal];
    //[self.clearButton.titleLabel setFont:[UIFont systemFontOfSize:35]];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"ItemManageViewController - viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tableView beginUpdates];
    //_priceItems = [DataModel sharedInstance].items;
    NSLog(@"Item Count: %i", [DataModel sharedInstance].items.count);
   // [self.tableView ]
    [self.tableView reloadData];
    [self.tableView endUpdates];
    
    
    
}

-(void)priceItemDeleted:(ItemData *)priceItem{
    NSLog(@"Item Manage View Controller - priceItemDeleted");
    NSUInteger index = [_priceItems indexOfObject:priceItem];
    [self.tableView beginUpdates];
    [_priceItems removeObject:priceItem];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    [self calculateTotal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource protocol methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"UITableView numberOFRowsInSection");
    return _priceItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ident = @"cell";
    
    //reuse or create a cell
    SpendifyUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident]; //forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[SpendifyUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    
    // find the price tiem for this index
    int index = [indexPath row];
    ItemData *item = _priceItems[index];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%i x %.02f", item.quantity ,item.priceAmount];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.delegate = self;
    cell.itemData = item;
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [[DataModel sharedInstance] currentColorScheme].buttonText;
    cell.textLabel.font = [UIFont systemFontOfSize:35];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(UIColor *)colorForIndex:(NSInteger)index{
    ColorPicker *p = [DataModel sharedInstance].currentColorScheme;
    NSUInteger itemCount = _priceItems.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed:p.tableRed green:p.tableGreen-(index/255) blue:p.tableBlue alpha:1.0];
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;

}

-(void)calculateTotal{
    
    float _total = 0.0f;
    for(int i = 0; i < _priceItems.count; i++){
        _total = _total +( [[_priceItems objectAtIndex:i] priceAmount] * [[_priceItems objectAtIndex:i] quantity] );
    }
    
    [self.totalLabel setText:[NSString stringWithFormat:@"%.02f", _total]];
}

#pragma mark button IBActions

-(IBAction)clearPriceItems:(id)sender{
    NSLog(@"ItemManageViewController - clearPriceItems");
   // [self.tableView beginUpdates];
    //[_priceItems removeAllObjects];
    [[[DataModel sharedInstance] items] removeAllObjects];
    NSLog(@"ItemManageView Controller - Items Left after clear: %i", [DataModel sharedInstance].items.count);
    [self.tableView reloadData];
   // [self.tableView endUpdates];
    [self calculateTotal];
}



#pragma mark SpendifyItemDatasourceProtocol Methods
-(void)addPriceItem:(ItemData *)priceItem{
    [_priceItems addObject:priceItem];
}



@end

















