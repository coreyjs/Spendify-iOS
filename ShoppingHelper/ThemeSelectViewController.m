//
//  ThemeSelectViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "ThemeSelectViewController.h"
#import "DataModel.h"
#import "ColorPicker.h"
#include "ItemInputViewController.h"

@interface ThemeSelectViewController (){
    
    NSInteger *m_indexPath;
}


@end

@implementation ThemeSelectViewController

@synthesize backButton = _backButton;
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];

    DataModel *m = [DataModel sharedInstance];
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
   // [self.backButton.titleLabel setFont:[UIFont fontWithName:@"PoplarStd" size:50]];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    self.view.backgroundColor = [m currentColorScheme].addButton;
    self.tableView.backgroundColor = [m currentColorScheme].addButton;
    
    [self updateViewNotficationsOnChange];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 13;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];// forIndexPath:indexPath];
    
    // configure cell
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    ColorScheme currentColor = [[DataModel sharedInstance] currentColorScheme].selectedColorScheme;
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"Spendify";
        if( currentColor == DEFAULT_SPENDIFY )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 1 ){
        cell.textLabel.text = @"Earth Retro";
        if( currentColor == EARTH_RETRO )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 2 ){
        cell.textLabel.text = @"Femenesque";
        if( currentColor == FEMENSQUE )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 3 ){
        cell.textLabel.text = @"Ego";
        if( currentColor == MALE_EGO )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 4 ){
        cell.textLabel.text = @"Metro";
        if( currentColor == METRO )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 5 ){
        cell.textLabel.text = @"Film Noir";
        if( currentColor == FILM_NOIR )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 6 ){
        cell.textLabel.text = @"Blue Sky";
        if( currentColor == BLUE_SKY )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 7 ){
        cell.textLabel.text = @"Candy";
        if( currentColor == CANDY )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 8 ){
        cell.textLabel.text = @"Lilac";
        if( currentColor == LILAC )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 9 ){
        cell.textLabel.text = @"Autumn Spice";
        if( currentColor == AUTUMN_SPICE )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 10 ){
        cell.textLabel.text = @"Fresh Start";
        if( currentColor == FRESH_START )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 11 ){
        cell.textLabel.text = @"Sparkle";
        if( currentColor == SPARKLE )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
    }else if( indexPath.row == 12 ){
        cell.textLabel.text = @"Aquatic";
        if( currentColor == AQUATIC )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [[DataModel sharedInstance] currentColorScheme].addButton;
   // cell.textLabel.font = [UIFont fontWithName:@"PoplarStd" size:35];
  //  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - UITableViewDataDelegate protocol methods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonText;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

-(IBAction)closeView:(id)sender{
    
    NSLog(@"Back Button Pressed");
   [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier]; //forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    if(indexPath.row == 0){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:DEFAULT_SPENDIFY];
    }else if( indexPath.row == 1 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:EARTH_RETRO];
    }else if( indexPath.row == 2 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:FEMENSQUE];
    }else if( indexPath.row == 3 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:MALE_EGO];
    }else if( indexPath.row == 4 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:METRO];
    }else if( indexPath.row == 5 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:FILM_NOIR];
    }else if( indexPath.row == 6 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:BLUE_SKY];
    }else if( indexPath.row == 7 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:CANDY];
    }else if( indexPath.row == 8 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:LILAC];
    }else if( indexPath.row == 9 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:AUTUMN_SPICE];
    }else if( indexPath.row == 10 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:FRESH_START];
    }else if( indexPath.row == 11 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:SPARKLE];
    }else if( indexPath.row == 12 ){
        [[[DataModel sharedInstance] currentColorScheme] switchScheme:AQUATIC];
    }
    
    [[DataModel sharedInstance] setColorChanged:YES];
    
//    [(ItemInputViewController*)self.navigationController.parentViewController.parentViewController updateViewOnChange];
//    [[DataModel sharedInstance] setColorChanged:NO];
    
    [self updateViewNotficationsOnChange];
}

#pragma mark private methods

-(void)updateViewNotficationsOnChange{
    
    NSLog(@"ThemeSelectViewController - updateViewNotificationsOnChange");
    DataModel *m = [DataModel sharedInstance];
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
    // [self.backButton.titleLabel setFont:[UIFont fontWithName:@"PoplarStd" size:50]];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];

    
    
    for(UITableViewCell* cell in [self.tableView visibleCells]){
        cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [[DataModel sharedInstance] currentColorScheme].addButton;
        // cell.textLabel.font = [UIFont fontWithName:@"PoplarStd" size:35];
        //  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    self.view.backgroundColor = [m currentColorScheme].addButton;
    self.tableView.backgroundColor = [m currentColorScheme].addButton;
    
    
    [self.tableView reloadData];
    
}

@end




















