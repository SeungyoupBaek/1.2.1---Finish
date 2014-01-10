//
//  Cart.h
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "CartItem.h"

@interface Cart : NSObject
@property (strong, nonatomic) NSMutableArray* items;

-(void)addProduct:(Product*)item;
-(void)incQuantity:(NSString*)productCode;
-(void)decQuantitiy:(NSString*)productCode;

-(CartItem *)cartItemsWith:(NSString*)productCode;


@end
