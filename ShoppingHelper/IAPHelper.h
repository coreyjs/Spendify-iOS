//
//  IAPHelper.h
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/22/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
UIKIT_EXTERN NSString *const IAPHelperProductPurchasedNotification;

typedef void (^RequestProductsCompletionHanlder)(BOOL success, NSArray *products);

@interface IAPHelper : NSObject 

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers;
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHanlder)completionHandler;
// Add two new method declarations
- (void)buyProduct:(SKProduct *)product;
- (BOOL)productPurchased:(NSString *)productIdentifier;
- (void) restoreCompletedTransactions;

@end
