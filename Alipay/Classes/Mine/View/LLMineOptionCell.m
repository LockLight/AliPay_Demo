//
//  LLMineOptionCell.m
//  Alipay
//
//  Created by locklight on 17/1/15.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMineOptionCell.h"
#import "LLMineOption.h"

@interface LLMineOptionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation LLMineOptionCell

- (void)setMineOption:(LLMineOption *)mineOption{
    _mineOption = mineOption;
    
    self.iconView.image = [UIImage imageNamed:mineOption.icon];
    self.nameLabel.text = mineOption.name;
    self.subTitleLabel.text = mineOption.message;
}

@end
