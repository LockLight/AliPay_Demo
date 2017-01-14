//
//  LLChatOtherTableViewCell.m
//  Alipay
//
//  Created by locklight on 17/1/14.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLChatOtherTableViewCell.h"
#import "LLChat.h"
#import "UILabel+Addition.h"
#import "Masonry.h"

@interface LLChatOtherTableViewCell ()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *textView;
@end

@implementation LLChatOtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //清空cell背景色
    self.backgroundColor = [UIColor clearColor];
    //默认间距
    CGFloat margin = 8;
    //时间标签
    UILabel *timeLabel = [UILabel makeLabelWithText:@"17.30" andTextColor:[UIColor lightGrayColor] andTextFont:13];
    //设置label居中
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:timeLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(margin);
    }];
    
    //头像
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"user02_icon"];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(margin);
        make.top.equalTo(timeLabel.mas_bottom).offset(margin);
        make.height.width.offset(50);
    }];
    //聊天背景
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"Dialog_white.right"];
    [self.contentView addSubview:bgView];
    
    //聊天内容
    UILabel *textView = [UILabel makeLabelWithText:@"微笑的对我说声好久不见~" andTextColor:[UIColor darkGrayColor] andTextFont:15];
    //自动换行,最大宽度
    textView.numberOfLines = 0;
    textView.preferredMaxLayoutWidth = 200;
    [self.contentView addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(margin *3);
        make.top.equalTo(iconView.mas_top).offset(margin);
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(textView).mas_offset(UIEdgeInsetsMake(-margin, -margin * 2, -margin, - margin));
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).offset(0);
#warning mark 哪个更高根据哪个约束
        make.bottom.greaterThanOrEqualTo(bgView.mas_bottom).offset(margin);
        make.bottom.greaterThanOrEqualTo(iconView.mas_bottom).offset(margin);
        
        _timeLabel = timeLabel;
        _textView = textView;
    }];
}

- (void)setChat:(LLChat *)chat{
    _chat = chat;
    
    _timeLabel.text  = chat.time;
    _textView.text = chat.text;
}
@end

