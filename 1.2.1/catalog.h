//
//  catalog.h
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface catalog : NSObject

-(id)productAt:(NSInteger)index;
-(NSInteger)numberOfProduct;
-(Product *)productWithCode:(NSString *)productCode;
+(id)defaultCatalog;

@end
