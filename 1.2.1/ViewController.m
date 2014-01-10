//
//  ViewController.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "catalog.h"
#import "Cart.h"
#import "CartCell.h"
#import "ProductDetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CartDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart* cart;

@end

@implementation ViewController


-(void)incQuantity:(NSString *)productCode{
    [self.cart incQuantity:productCode];
    
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)decQuantitiy:(NSString *)productCode{
    [self.cart decQuantitiy:productCode];
    
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// catalog Delegate : addItem
-(void)addItem:(id)sender{
    // product identifier for index
    NSIndexPath* indexPath = [self.table indexPathForCell:sender];
    Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
    
    
    // 핵심
    [self.cart addProduct:product];
    
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// section 0 : catalog, section : cart
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(0 == section){
        return [[catalog defaultCatalog] numberOfProduct];
    }else{
        return  self.cart.items.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0 == indexPath.section){
        ProductCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        //viewController conduct cell's delegate
        cell.delegate = self;
        Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    else{
        // second section for cart
        CartCell* cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        CartItem* cartItem = self.cart.items[indexPath.row];
        [cell setCarItem:cartItem];
        return cell;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(0 == section){
        return @"Product";
    }else{
        return @"Items in Cart";
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cart = [[Cart alloc]init];
    self.cart.items = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // 제품 상세보기 뷰 컨트롤러
    ProductDetailViewController* detailVC = segue.destinationViewController;
    
    NSIndexPath* indexPath = [self.table indexPathForCell:sender];
    Product* selectedProduct = [[catalog defaultCatalog] productAt:indexPath.row];
    
    // 제품 코드를 넘겨줌
    detailVC.productCode = selectedProduct.code;
}

@end
