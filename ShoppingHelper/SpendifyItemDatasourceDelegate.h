//
//  SpendifyItemDatasourceDelegate.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/12/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemData.h"

@protocol SpendifyItemDatasourceDelegate <NSObject>

-(void)addPriceItem:(ItemData *)priceItem;

@end
