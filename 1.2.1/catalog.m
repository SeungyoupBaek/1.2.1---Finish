//
//  catalog.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "catalog.h"


@implementation catalog{
    NSArray* data;
}


-(Product *)productWithCode:(NSString *)productCode{
    for (Product *one in data) {
        if ([ one isEqualProduct:productCode]) {
            return one;
        }
    }
    return nil;
}

-(id)productAt:(NSInteger)index{
    return [data objectAtIndex:index];
}
-(NSInteger)numberOfProduct{
    return data.count;
}


static catalog* _instance = nil;
+(id)defaultCatalog{
    if (nil == _instance){
        _instance = [[catalog alloc]init];
    }
    return _instance;
}

-(id)init{
    self = [super init];
    if (self) {
        data = @[[Product productWithName:@"BaseBall" code:@"1" price:@"100" image:@"Baseball.png"],
                 [Product productWithName:@"BasketBall" code:@"2" price:@"200" image:@"Basketball.png"],
                 [Product productWithName:@"FootBall" code:@"3" price:@"250" image:@"Football.png"],
                 [Product productWithName:@"VolleyBall" code:@"4" price:@"300" image:@"Volleyball.png"]];
    }
    return self;
}
@end
