//
//  ItemData.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/2/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemData : NSObject

@property (strong) NSString *name;
@property (assign) float priceAmount;
@property (assign) int quantity;

-(id) initWithName:(NSString*) name price:(float)price quantity:(int)quantity;

@end
