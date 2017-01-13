//
//  UILabel+Addition.m
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

/**
 快速创建Label

 @param text label内容
 @param color label颜色
 @param font laber字体
 */
+ (instancetype)makeLabelWithText:(NSString *)text andTextColor:(UIColor *)color andTextFont:(CGFloat )font{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}
@end
