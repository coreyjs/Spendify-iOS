//
//  DataModel.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "DataModel.h"
#import "ColorPicker.h"

@implementation DataModel

@synthesize items = _items;
@synthesize currentColorScheme = _currentColorScheme;
@synthesize colorChanged = _colorChanged;
@synthesize showTutorial = _showTutorial;
#pragma mark SingletonSettings

static DataModel *instance = nil;

+(DataModel*) sharedInstance{
    
    @synchronized( [DataModel class] ){
        if(!instance){
            instance = [[DataModel alloc] init];
        }
        
        return instance;
    }
    
    return nil;
}

-(id) init{
    
    if((self = [super init])){
        self.items = [[NSMutableArray alloc] init];
        self.currentColorScheme = [[ColorPicker alloc] init];
        //[[NSUserDefaults standardUserDefaults] synchronize];
        self.colorChanged = NO;
        //self.showTutorial = YES;
        
        if( [[[NSUserDefaults standardUserDefaults] stringForKey:kShowIntroTutorial] isEqual: @"no"]){
            self.showTutorial = NO;
        }else{
            self.showTutorial = YES;
        }
    }
    
    
    
    return self;
}

-(void)setTutorialDefault:(BOOL)value{
    NSLog(@"Bool set for tutorial");
    [[NSUserDefaults standardUserDefaults] setValue:@"no" forKey:kShowIntroTutorial];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.showTutorial = value;
}

-(void)addItemData:(ItemData *)data{
    
    [self.items addObject:data];
}

//-(void)setColorChanged:(BOOL)colorChanged{
//    
//    self.colorChanged = colorChanged;
//}

@end








