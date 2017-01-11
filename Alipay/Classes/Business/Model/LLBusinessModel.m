//
//  LLBusinessModel.m
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/5.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessModel.h"

@implementation LLBusinessModel

//工厂方法实现  KVO 字典转模型
+ (instancetype)businessWithDict:(NSDictionary *)dict{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
@end
