//
//  CartDelegate.h
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol CartDelegate <NSObject>

// Add Product to Cart
-(void)addItem:(id)sender;

// Increase/Decrease Product in Cart
-(void)incQuantity:(NSString*)productCode;
-(void)decQuantitiy:(NSString*)productCode;


@end
