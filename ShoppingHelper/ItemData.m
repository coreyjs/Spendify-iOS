//
//  ItemData.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import "ItemData.h"

@implementation ItemData

@synthesize name = _name;
@synthesize priceAmount = _priceAmount;
@synthesize quantity = _quantity;

-(id) initWithName:(NSString *)name price:(float)price quantity:(int)quantity{
    
    if((self = [super init])){
        
        self.name = name;
        self.priceAmount = price;
        self.quantity = quantity;
    }
    
    return self;
    
}

@end
