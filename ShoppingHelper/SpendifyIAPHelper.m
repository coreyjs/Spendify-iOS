//
//  SpendifyIAPHelper.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "SpendifyIAPHelper.h"

@implementation SpendifyIAPHelper



+(SpendifyIAPHelper *)sharedInstance{
    static dispatch_once_t once;
    static SpendifyIAPHelper *sharedInstance;
    
    dispatch_once(&once, ^{
        
        NSSet *productIdentifiers = [NSSet setWithObjects:kThemesAndAds, nil];
        
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
        
    });
    
    return sharedInstance;
}

@end
