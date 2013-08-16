//
//  SpendifyIAPHelper.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "IAPHelper.h"

#define kThemesAndAds @"com.blaqksheep.spendify.themesandremoveads"

@interface SpendifyIAPHelper : IAPHelper

+(SpendifyIAPHelper *)sharedInstance;

@end
