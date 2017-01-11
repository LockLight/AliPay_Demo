//
//  LLBusinessTopPic.m
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/5.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessTopPic.h"

@implementation LLBusinessTopPic

+ (instancetype)businessTopPicWithNib{
    UINib *nib = [UINib nibWithNibName:@"LLBusinessTopPic" bundle:nil];
    return [[nib instantiateWithOwner:nil options:nil] firstObject];
}

@end
