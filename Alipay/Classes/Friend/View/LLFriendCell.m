//
//  LLFriendCell.m
//  Alipay
//
//  Created by locklight on 17/1/12.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLFriendCell.h"

@interface LLFriendCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation LLFriendCell


-(void)setFriendData:(LLFriend *)friendData{
    _friendData = friendData;
    
    self.iconView.image = [UIImage imageNamed:friendData.icon];
    self.titleLabel.text = friendData.title;
    self.subTitleLabel.text = friendData.subTitle;
    self.timeLabel.text = friendData.time;
}

@end
