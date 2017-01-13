//
//  LLMoment.m
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMoment.h"

@implementation LLMoment

+ (instancetype)momentWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
