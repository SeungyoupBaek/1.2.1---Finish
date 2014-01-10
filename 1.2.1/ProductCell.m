//
//  ProductCell.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell()

@property (weak, nonatomic)IBOutlet UILabel* productName;
@property (weak, nonatomic)IBOutlet UILabel* productPrice;
@property (weak, nonatomic)IBOutlet UIImageView* productImage;

@end

@implementation ProductCell

-(void)setProductInfo:(Product *)item{
    _productName.text = item.productName;
    _productPrice.text = item.productPrice;
    _productImage.image = [UIImage imageNamed:item.imageName];
}

-(IBAction)addCart:(id)sender{
    [_delegate addItem:self];
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
