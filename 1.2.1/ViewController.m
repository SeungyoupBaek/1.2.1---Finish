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
#import "CartViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CartDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart* cart;

@end

@implementation ViewController


// catalog Delegate : addItem
-(void)addItem:(id)sender{
    // product identifier for index
    NSIndexPath* indexPath = [self.table indexPathForCell:sender];
    Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
    
    
    // 핵심
    [self.cart addProduct:product];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"카트에 들어갔습니다" delegate:self cancelButtonTitle:@"닫기" otherButtonTitles:@"확인", nil];
    [alert show];
//    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.firstOtherButtonIndex){
        self.tabBarController.selectedIndex = 1;

    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

        return [[catalog defaultCatalog] numberOfProduct];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(0 == indexPath.section){
        ProductCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        //viewController conduct cell's delegate
        cell.delegate = self;
        Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cart = [Cart defaultCart];
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
