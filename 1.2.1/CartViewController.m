//
//  CartViewController.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 13..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartViewController.h"
#import "CartDelegate.h"
#import "Cart.h"
#import "CartCell.h"
#import "CartItem.h"

@interface CartViewController ()< UITableViewDataSource, CartCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) Cart* cart;

@end

@implementation CartViewController
// 카트 내 상품 수량 증가(델리게이트 메소드)
-(void)incQuantity:(NSString*)productCode{
    [[Cart defaultCart] incQuantity:productCode];
    [self.table reloadData];
}

// 카트 내 상품 수량 감소(델리게이트 메소드)
-(void)decQuantity:(NSString*)productCode{
    [[Cart defaultCart] decQuantity:productCode];
    [self.table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Cart* cart = [Cart defaultCart];
    return cart.items.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
    // 수량 추가/감소를 처리할 델리게이트
    cell.delegate = self;
  
    
    // 셀 컨텐츠
    CartItem* cartItem = self.cart.items[indexPath.row];
    [cell setCarItem:cartItem];
    return cell;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cart = [Cart defaultCart];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
