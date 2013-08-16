//
//  SpendifyUITableViewCell.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/13/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemData.h"
#import "SpendifyTableViewDelegate.h"

@interface SpendifyUITableViewCell : UITableViewCell

// the item the cell renders
@property (nonatomic) ItemData *itemData;

// the object htat acts as a delegate for this cell
@property (nonatomic, assign) id<SpendifyTableViewDelegate> delegate;

@end
