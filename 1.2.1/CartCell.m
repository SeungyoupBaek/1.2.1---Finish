//
//  CartCell.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartCell.h"
#import "CartItem.h"

@interface CartCell()

@property(copy, nonatomic) NSString* productCode;
@property(weak, nonatomic) IBOutlet UILabel* name;
@property(weak, nonatomic) IBOutlet UILabel* quantity;

@end

@implementation CartCell

-(IBAction)plusClicked:(id)sender{
    [self.delegate incQuantity:self.productCode];
}

-(IBAction)minusClicked:(id)sender{
    [self.delegate decQuantitiy:self.productCode];
}


// 셀에 반영할 내용
-(void)setCarItem:(CartItem *)item{
    // 제품 구별용 코드
    self.productCode = item.product.code;
    // 셀 반영
    self.name.text = item.product.productName;
    self.quantity.text = [NSString stringWithFormat:@"%d개", item.quantity];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
