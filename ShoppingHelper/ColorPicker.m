//
//  ColorPicker.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/6/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "ColorPicker.h"

@implementation ColorPicker

@synthesize backgroundColor = _backgroundColor;
@synthesize labelPriceColor = _labelPriceColor;
@synthesize labelQuantityColor = _labelQuantityColor;
@synthesize buttonColor = _buttonColor;
@synthesize buttonText = _buttonText;
@synthesize addButton = _addButton;
@synthesize addButtonText = _addButtonText;
@synthesize selectedColorScheme = _selectedColorScheme;


-(id)init{
    
    if( (self = [super init])){
        
        [self loadSettings];
        [self switchScheme:self.selectedColorScheme];
    }
    
    return self;
}

#define NSKEY_COLORSCHEME @"colorScheme"

-(void)loadSettings{
        
    if( [[NSUserDefaults standardUserDefaults] integerForKey:NSKEY_COLORSCHEME]){
        self.selectedColorScheme = [[NSUserDefaults standardUserDefaults] integerForKey:NSKEY_COLORSCHEME];
    }else{
        self.selectedColorScheme = DEFAULT_SPENDIFY;
    }
}

-(void)saveSettings{
    [[NSUserDefaults standardUserDefaults] setInteger:self.selectedColorScheme forKey:@"colorScheme"];
    
}

//DEFAULT_SPENDIFY = 0,
//EARTH_RETRO = 1,
// FEMENSQUE = 2,
// DONE MALE_EGO = 3,
// DONE METRO = 4,
// DONE FILM_NOIR = 5,
// DONE BLUE_SKY = 6,
// DONE CANDY = 7,
// DONE LILAC = 8,
// DONE AUTUMN_SPICE = 9,
// DONE FRESH_START = 10,
// DONE SPARKLE = 11,
// DONE AQUATIC = 12
-(void)switchScheme:(ColorScheme)newScheme{
    
    self.selectedColorScheme = newScheme;
    [self saveSettings];
    
    switch (newScheme) {

        // 1
        case EARTH_RETRO:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(88/255.0)
                                                      green:(163/255.0)
                                                       blue:(135/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(59/255.0)
                                                   green:(25/255.0)
                                                    blue:(25/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(88/255.0)
                                              green:(163/255.0)
                                               blue:(135/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(59/255.0)
                                               green:(25/255.0)
                                                blue:(25/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(88/255.0)
                                                 green:(163/255.0)
                                                  blue:(135/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(59/255.0)
                                             green:(25/255.0)
                                              blue:(25/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(199/255.0)
                                                   green:(178/255.0)
                                                    blue:(66/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
            
        // 2
        case FEMENSQUE:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(208/255.0)
                                                      green:(194/255.0)
                                                       blue:(209/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(191/255.0)
                                                   green:(55/255.0)
                                                    blue:(193/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(208/255.0)
                                              green:(194/255.0)
                                               blue:(209/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(191/255.0)
                                               green:(55/255.0)
                                                blue:(193/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(227/255.0)
                                                 green:(141/255.0)
                                                  blue:(223/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(191/255.0)
                                             green:(55/255.0)
                                              blue:(193/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(227/255.0)
                                                   green:(141/255.0)
                                                    blue:(223/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

            
        // 3
        case MALE_EGO:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(217/255.0)
                                                      green:(216/255.0)
                                                       blue:(199/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(162/255.0)
                                                   green:(171/255.0)
                                                    blue:(69/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(66/255.0)
                                              green:(58/255.0)
                                               blue:(58/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(162/255.0)
                                               green:(171/255.0)
                                                blue:(69/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(66/255.0)
                                                 green:(58/255.0)
                                                  blue:(58/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(162/255.0)
                                             green:(171/255.0)
                                              blue:(69/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(66/255.0)
                                                   green:(58/255.0)
                                                    blue:(58/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
            
        // 4
        case METRO:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(208/255.0)
                                                      green:(196/255.0)
                                                       blue:(180/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(50/255.0)
                                                   green:(32/255.0)
                                                    blue:(18/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(208/255.0)
                                              green:(196/255.0)
                                               blue:(180/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(156/255.0)
                                               green:(171/255.0)
                                                blue:(52/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(208/255.0)
                                                 green:(196/255.0)
                                                  blue:(180/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(156/255.0)
                                             green:(171/255.0)
                                              blue:(52/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(119/255.0)
                                                   green:(115/255.0)
                                                    blue:(95/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

            
        // 5
        case FILM_NOIR:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(81/255.0)
                                                      green:(77/255.0)
                                                       blue:(89/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(39/255.0)
                                                   green:(31/255.0)
                                                    blue:(42/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(184/255.0)
                                              green:(184/255.0)
                                               blue:(184/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(39/255.0)
                                               green:(31/255.0)
                                                blue:(42/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(184/255.0)
                                                 green:(184/255.0)
                                                  blue:(184/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(39/255.0)
                                             green:(31/255.0)
                                              blue:(42/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(184/255.0)
                                                   green:(184/255.0)
                                                    blue:(184/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
            
        // 6
        case BLUE_SKY:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(215/255.0)
                                                      green:(218/255.0)
                                                       blue:(219/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(21/255.0)
                                                   green:(34/255.0)
                                                    blue:(59/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(215/255.0)
                                              green:(218/255.0)
                                               blue:(219/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(21/255.0)
                                               green:(34/255.0)
                                                blue:(59/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(41/255.0)
                                                 green:(77/255.0)
                                                  blue:(121/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(21/255.0)
                                             green:(34/255.0)
                                              blue:(59/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(41/255.0)
                                                   green:(77/255.0)
                                                    blue:(121/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

            
        // 7
        case CANDY:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(244/255.0)
                                                      green:(228/255.0)
                                                       blue:(175/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(234/255.0)
                                                   green:(156/255.0)
                                                    blue:(60/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(71/255.0)
                                              green:(148/255.0)
                                               blue:(142/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(181/255.0)
                                               green:(62/255.0)
                                                blue:(133/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(71/255.0)
                                                 green:(148/255.0)
                                                  blue:(142/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(41/255.0)
                                             green:(41/255.0)
                                              blue:(51/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(71/255.0)
                                                   green:(148/255.0)
                                                    blue:(142/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
        
        // 8
        case LILAC:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(181/255.0)
                                                      green:(177/255.0)
                                                       blue:(177/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(92/255.0)
                                                   green:(53/255.0)
                                                    blue:(71/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(181/255.0)
                                              green:(177/255.0)
                                               blue:(177/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(41/255.0)
                                               green:(41/255.0)
                                                blue:(51/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(139/255.0)
                                                 green:(125/255.0)
                                                  blue:(147/255.0) alpha:1];
            
            // Add Button
            self.addButton = [UIColor colorWithRed:(41/255.0)
                                             green:(41/255.0)
                                              blue:(51/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(139/255.0)
                                                   green:(125/255.0)
                                                    blue:(147/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
            
        // 9
        case AUTUMN_SPICE:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(229/255.0)
                                                      green:(189/255.0)
                                                       blue:(119/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(214/255.0)
                                                   green:(118/255.0)
                                                    blue:(71/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(71/255.0)
                                              green:(66/255.0)
                                               blue:(67/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(214/255.0)
                                               green:(118/255.0)
                                                blue:(71/255.0) alpha:1];
    
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(71/255.0)
                                                 green:(66/255.0)
                                                  blue:(67/255.0) alpha:1];
            
            // Add Button
            self.addButton = [UIColor colorWithRed:(214/255.0)
                                             green:(118/255.0)
                                              blue:(71/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(71/255.0)
                                                   green:(66/255.0)
                                                    blue:(67/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

        // 10
        case FRESH_START:
            // Quantity
            self.labelQuantityColor =[UIColor colorWithRed:(173/255.0)
                                                     green:(163/255.0)
                                                      blue:(161/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(120/255.0)
                                                   green:(81/255.0)
                                                    blue:(76/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(224/255.0)
                                              green:(216/255.0)
                                               blue:(211/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(173/255.0)
                                               green:(163/255.0)
                                                blue:(161/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(224/255.0)
                                                 green:(216/255.0)
                                                  blue:(211/255.0) alpha:1];
            
            // Add Button
            self.addButton = [UIColor colorWithRed:(173/255.0)
                                             green:(163/255.0)
                                              blue:(161/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(224/255.0)
                                                   green:(216/255.0)
                                                    blue:(211/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

        // 11
        case SPARKLE:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(202/255.0)
                                                      green:(195/255.0)
                                                       blue:(206/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(70/255.0)
                                                   green:(56/255.0)
                                                    blue:(82/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(202/255.0)
                                              green:(195/255.0)
                                               blue:(206/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(70/255.0)
                                               green:(56/255.0)
                                                blue:(82/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(166/255.0)
                                                 green:(149/255.0)
                                                  blue:(164/255.0) alpha:1];
            
            // Add Button
            self.addButton = [UIColor colorWithRed:(70/255.0)
                                             green:(56/255.0)
                                              blue:(82/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(166/255.0)
                                                   green:(149/255.0)
                                                    blue:(164/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;

            
        // 12
        case AQUATIC:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(92/255.0)
                                                      green:(86/255.0)
                                                       blue:(86/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(29/255.0)
                                                   green:(24/255.0)
                                                    blue:(31/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(224/255.0)
                                              green:(109/255.0)
                                               blue:(47/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(64/255.0)
                                               green:(81/255.0)
                                                blue:(89/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(155/255.0)
                                                 green:(167/255.0)
                                                  blue:(170/255.0) alpha:1];
            
            // Add Button
            self.addButton = [UIColor colorWithRed:(64/255.0)
                                             green:(81/255.0)
                                              blue:(89/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(155/255.0)
                                                   green:(167/255.0)
                                                    blue:(170/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;
            
            break;
            
        // DEFAULT GREEN SPENDIFY COLORS
        default:
            // Quantity
            self.labelQuantityColor = [UIColor colorWithRed:(54/255.0)
                                                      green:(167/255.0)
                                                       blue:(96/255.0) alpha:1];
            // Price
            self.labelPriceColor = [UIColor colorWithRed:(8/255.0)
                                                   green:(79/255.0)
                                                    blue:(35/255.0) alpha:1];
            
            // Button Text
            self.buttonText = [UIColor colorWithRed:(255/255.0)
                                              green:(255/255.0)
                                               blue:(255/255.0) alpha:1];
            
            // Button Background
            self.buttonColor = [UIColor colorWithRed:(54/255.0)
                                               green:(167/255.0)
                                                blue:(96/255.0) alpha:1];
            
            // Add Button Text
            self.addButtonText = [UIColor colorWithRed:(255/255.0)
                                                 green:(255/255.0)
                                                  blue:(255/255.0) alpha:1];
            // Add Button
            self.addButton = [UIColor colorWithRed:(8/255.0)
                                             green:(79/255.0)
                                              blue:(35/255.0) alpha:1];
            // Background
            self.backgroundColor = [UIColor colorWithRed:(255/255.0)
                                                   green:(255/255.0)
                                                    blue:(255/255.0) alpha:1];
            
            self.tableRed = 222/255.0;
            self.tableGreen = 158.0/255.0;
            self.tableBlue = 104.0/255.0;

            break;
    }
}

@end
