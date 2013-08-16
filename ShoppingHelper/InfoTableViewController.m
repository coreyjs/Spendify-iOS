//
//  InfoTableViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/18/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "InfoTableViewController.h"
#import "DataModel.h"
#import "ColorPicker.h"
#import "SpendifyIAPHelper.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController

@synthesize tableView = _tableView;
@synthesize backButton = _backButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"InfoTableViewController - view did appear");
    [self updateViewNotficationsOnChange];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    self.tableView.dataSource = self;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f)
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
    
    DataModel *m = [DataModel sharedInstance];
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
    //[self.backButton.titleLabel setFont:[UIFont fontWithName:@"PoplarStd" size:50]];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    self.view.backgroundColor = [m currentColorScheme].addButton;
    self.tableView.backgroundColor = [m currentColorScheme].addButton;
    
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; // forIndexPath:indexPath];
    
    // Configure the cell...
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [[DataModel sharedInstance] currentColorScheme].addButton;
   // cell.textLabel.font = [UIFont fontWithName:@"PoplarStd" size:35];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"About";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"How To";
    }
    else if(indexPath.row == 2){
        cell.textLabel.text = @"Themes";
    }
    

    
    return cell;
}

#pragma mark - UITableViewDataDelegate protocol methods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonText;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if(indexPath.row == 0){
        //[self prepareForSegue:@"howto" sender:self];
        [self performSegueWithIdentifier:@"howto" sender:self];
    }else if(indexPath.row == 1){
        [self performSegueWithIdentifier:@"tutorial" sender:self];
    }
    else if(indexPath.row == 2){
    
        if( [[SpendifyIAPHelper sharedInstance] productPurchased:kThemesAndAds] ){
        
            [self performSegueWithIdentifier:@"themes" sender:self];
            
        }else{
            
            [self performSegueWithIdentifier:@"buythemes" sender:self];
        }
    
    
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   // [self performSegueWithIdentifier:[segue identifier] sender:self.view];
}




-(IBAction)closeView:(id)sender{
    NSLog(@"Back Button Pressed");
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)updateViewNotficationsOnChange{
    
    NSLog(@"ThemeSelectViewController - updateViewNotificationsOnChange");
    DataModel *m = [DataModel sharedInstance];
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
    // [self.backButton.titleLabel setFont:[UIFont fontWithName:@"PoplarStd" size:50]];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];
    
    self.view.backgroundColor = [m currentColorScheme].addButton;
    self.tableView.backgroundColor = [m currentColorScheme].addButton;
    
    
    for(UITableViewCell* cell in [self.tableView visibleCells]){
        cell.backgroundColor = [[DataModel sharedInstance] currentColorScheme].buttonColor;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [[DataModel sharedInstance] currentColorScheme].addButton;
        // cell.textLabel.font = [UIFont fontWithName:@"PoplarStd" size:35];
        //  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    [self.tableView reloadData];
    
}

@end











