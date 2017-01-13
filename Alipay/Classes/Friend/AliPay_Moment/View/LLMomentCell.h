//
//  LLMomentCell.h
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLMoment;

@interface LLMomentCell : UITableViewCell
//定义属性接收模型数据
@property (nonatomic,strong) LLMoment *moment;

@end
