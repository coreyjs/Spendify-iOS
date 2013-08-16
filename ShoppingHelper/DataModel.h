//
//  DataModel.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemData;
@class ColorPicker;

#define kShowIntroTutorial @"isIntroTutorial"

@interface DataModel : NSObject

@property (strong) NSMutableArray *items;
@property (strong) ColorPicker* currentColorScheme;
@property (assign) BOOL colorChanged;
@property (assign) BOOL showTutorial;

+(DataModel *) sharedInstance;
-(void) addItemData:(ItemData*) data;
-(void) setColorChanged:(BOOL)colorChanged;
-(void) setTutorialDefault:(BOOL)value;

@end
