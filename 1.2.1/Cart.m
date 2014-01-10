//
//  Cart.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Cart.h"
@interface Cart()


@end

@implementation Cart

-(void)addProduct:(Product*)item{
    // 카트내 동일 상품 검색
    CartItem *cartItem = [self cartItemsWith:item.code];
    if( cartItem == nil){
        // 동일 검색 실패 -> 새로운 상품을 카트에 추가
        cartItem = [[CartItem alloc]init];
        cartItem.product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    }else{
        // 동일 제품 검색 성공 -> 제품 수량 증가
        [self incQuantity:item.code];
    }
    
    
}
// Increase/Decrease Product in Cart
-(void)incQuantity:(NSString*)productCode{
    CartItem* item = [self cartItemsWith:productCode];
    item.quantity++;
}
-(void)decQuantitiy:(NSString*)productCode{
    CartItem* item = [self cartItemsWith:productCode];
    item.quantity--;
    
    if( 0 == item.quantity){
        [self.items removeObject:item];
    };
}

-(CartItem*)cartItemsWith:(NSString*)productCode{
    
    for(CartItem* item in self.items){
        if ([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    return nil;
//    for( CartItem* item in self.items){
//        if (product.productName == item.product.productName) {
//            return YES;
//        }
//    }
//    return NO;
}

@end

