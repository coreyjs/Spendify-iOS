//
//  RearMenuViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/16/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "RearMenuViewController.h"
#import "ItemInputViewController.h"

@interface RearMenuViewController ()

@end

@implementation RearMenuViewController

@synthesize rearTable = _rearTable;

#pragma mark - UITableView Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"rearMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"About";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"How To";
    }else if(indexPath.row == 2){
        cell.textLabel.text = @"Items";
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"Themes";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // grab a handle to the item input controller, as if you'd do with a naviation controller via self.navigationController
    ItemInputViewController *initalInputController = [self.parentViewController isKindOfClass:[ItemInputViewController class]] ? (ItemInputViewController *)self.parentViewController : nil;
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
