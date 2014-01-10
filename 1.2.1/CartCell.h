//
//  CartCell.h
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartItem.h"
#import "CartDelegate.h"
#import "Product.h"

@interface CartCell : UITableViewCell

@property (weak, nonatomic) id<CartDelegate> delegate;
-(void)setCarItem:(CartItem *)item;

@end
