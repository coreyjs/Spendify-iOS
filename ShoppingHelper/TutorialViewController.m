//
//  TutorialViewController.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 2/6/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "TutorialViewController.h"
#import "DataModel.h"
#import "ColorPicker.h"

@interface TutorialViewController ()

@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;
@property (nonatomic, strong) UIImageView *imageView;


- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;

@end

@implementation TutorialViewController

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;

@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;
@synthesize backButton = _backButton;

#pragma mark -

- (void)loadVisiblePages {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    self.pageControl.currentPage = page;
    
    // Work out which pages we want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
}

- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    // Load an individual page, first seeing if we've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.view.bounds; //self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview:newPageView];
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
}

- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}

#pragma mark -


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
    
    NSLog(@"TutorialViewController - viewDidLoad");
    DataModel *m = [DataModel sharedInstance];
    
    
    [self.backButton setBackgroundColor:[m currentColorScheme].addButton];
    self.backButton.titleLabel.backgroundColor = [UIColor clearColor];
    self.backButton.titleLabel.textColor = [m currentColorScheme].addButtonText;
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateSelected];
    [self.backButton setTitleColor:[m currentColorScheme].addButtonText forState:UIControlStateNormal];

    
    self.scrollView.delegate = self;
    
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"Spendify1.png"],
                       [UIImage imageNamed:@"Spendify5.png"],
                       [UIImage imageNamed:@"Spendify11.png"],
                       [UIImage imageNamed:@"Spendify12.png"],
                       [UIImage imageNamed:@"Spendify13.png"],
                       [UIImage imageNamed:@"Spendify14.png"],
                       [UIImage imageNamed:@"Spendify15.png"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    // 2
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    // 3
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if([[DataModel sharedInstance] showTutorial]){
       // self.backButton.hidden = YES;
        //self.backButton.titleLabel.text = @"Ok, Got It!";
    }
    
    self.pageControl.backgroundColor = [m currentColorScheme].addButton;
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Set up the content size of the scroll view
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    //[self.scrollView setFrame:CGRectMake(0, 0, 320, 800)];
    
    // Load the initial set of pages that are on screen
    [self loadVisiblePages];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
   // self.scrollView.contentSize = self.scrollViewInnerView.frame.size;
   // self.scrollView.contentOffset = [self.scrollOffsetToPersist CGPointValue];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeView:(id)sender{
    
    [[DataModel sharedInstance] setTutorialDefault:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.scrollView = nil;
    self.pageControl = nil;
    self.pageImages = nil;
    self.pageViews = nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages which are now on screen
    NSLog(@"Scroll Did Scroll");
    [self loadVisiblePages];
}



@end










