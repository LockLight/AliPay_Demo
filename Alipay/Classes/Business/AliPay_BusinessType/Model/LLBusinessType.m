//
//  LLBusinessType.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/7.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessType.h"

@implementation LLBusinessType

+ (instancetype)businessTypeWithDict:(NSDictionary *)dict{
    id obj = [[LLBusinessType alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
@end
