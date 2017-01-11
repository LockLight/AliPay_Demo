//
//  LLBusinessModel.h
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/5.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#warning mark   CGFloat类型 显示数据会有异常  转用float类型


@interface LLBusinessModel : NSObject
//商家图标
@property (nonatomic, copy) NSString *icon;
//商家姓名
@property (nonatomic, copy) NSString *name;
//商家星级评分
@property (nonatomic, strong) NSNumber *level;
//人均消费
@property (nonatomic, strong) NSNumber *averagePrice;
//距离
@property (nonatomic, strong) NSNumber *distance;
//折扣
@property (nonatomic, assign) float offNum;    //CGFloat类型 显示数据会有异常,转用float
//满减优惠
@property (nonatomic, copy) NSString *discount;

+ (instancetype)businessWithDict:(NSDictionary *)dict;
@end
