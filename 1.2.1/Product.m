//
//  Product.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"

@implementation Product

+(id)productWithName:(NSString*)name code:(NSString *)code price:(NSString*)price image:(NSString*)image;{
    Product * product = [[Product alloc] init];
    product.productName = name;
    product.code = code;
    product.productPrice = price;
    product.imageName = image;
    
    return product;
}

-(BOOL)isEqualProduct:(NSString*)productCode{
    return [self.code isEqualToString:productCode];
}

@end
