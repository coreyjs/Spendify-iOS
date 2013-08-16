//
//  ColorPicker.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/6/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    DEFAULT_SPENDIFY = 0,
    EARTH_RETRO = 1,
    FEMENSQUE = 2,
    MALE_EGO = 3,
    METRO = 4,
    FILM_NOIR = 5,
    BLUE_SKY = 6,
    CANDY = 7,
    LILAC = 8,
    AUTUMN_SPICE = 9,
    FRESH_START = 10,
    SPARKLE = 11,
    AQUATIC = 12
} ColorScheme;


@interface ColorPicker : NSObject

@property (strong) UIColor* backgroundColor;
@property (strong) UIColor* labelQuantityColor;
@property (strong) UIColor* labelPriceColor;
@property (strong) UIColor* buttonColor;
@property (strong) UIColor* buttonText;
@property (strong) UIColor* addButton;
@property (strong) UIColor* addButtonText;
@property (assign) float tableRed;
@property (assign) float tableGreen;
@property (assign) float tableBlue;

@property (assign) ColorScheme selectedColorScheme;

-(void)switchScheme:(ColorScheme)newScheme;
-(void)loadSettings;
-(id)initWithScheme:(ColorScheme)scheme;

@end
