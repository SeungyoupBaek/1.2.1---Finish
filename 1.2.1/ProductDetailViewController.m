//
//  ProductDetailViewController.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "catalog.h"
#import "Product.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end

@implementation ProductDetailViewController


-(void)viewWillAppear:(BOOL)animated{
    // 카탈로그에서 제품 정보를 얻어온다.
    catalog *icatalog = [catalog defaultCatalog];
    Product *iproduct = [icatalog productWithCode:self.productCode];
    
    // 제품 정보를 뷰에 반영
    self.imageView.image = [UIImage imageNamed:iproduct.imageName];
    self.nameLabel.text = iproduct.productName;
    self.priceLabel.text = iproduct.productPrice;
    self.title = iproduct.productName;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
