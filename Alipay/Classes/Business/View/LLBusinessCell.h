//
//  LLBusinessCell.h
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/4.
//  Copyright © 2017年 LockLight. All rights reserved.


#import <UIKit/UIKit.h>
@class LLBusinessModel;

@interface LLBusinessCell : UITableViewCell
//接收模型数据
@property (nonatomic, strong) LLBusinessModel *businessModel;

@end
