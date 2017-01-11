//
//  LLBusinessCell.m
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/4.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessCell.h"
#import "LLBusinessModel.h"
#import "LLLevelView.h"

@interface LLBusinessCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *offNum;

@property (weak, nonatomic) IBOutlet UILabel *discount;

@property (weak, nonatomic) IBOutlet LLLevelView *levelView;

@end

@implementation LLBusinessCell

- (void)setBusinessModel:(LLBusinessModel *)businessModel{
    //给模型赋值
    _businessModel = businessModel;
    
    self.iconView.image = [UIImage imageNamed:businessModel.icon];
    self.nameLabel.text = businessModel.name;
    self.averageLabel.text = [NSString stringWithFormat:@"人均消费%@元",businessModel.averagePrice];
    self.distanceLabel.text = [NSString stringWithFormat:@"距离中粮商务公园%@m",businessModel.distance];
    self.offNum.text = [NSString stringWithFormat:@"%@折",@(businessModel.offNum).description];
    self.discount.text = businessModel.discount;
    self.levelView.level = businessModel.level.integerValue;
}

@end
