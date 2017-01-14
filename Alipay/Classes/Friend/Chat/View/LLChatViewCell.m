//
//  LLChatViewCell.m
//  Alipay
//
//  Created by locklight on 17/1/13.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLChatViewCell.h"
#import "LLChat.h"
#import "UILabel+Addition.h"
#import "Masonry.h"

@interface LLChatViewCell ()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *textView;
@end

@implementation LLChatViewCell

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
    iconView.image = [UIImage imageNamed:@"user01_icon"];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-margin);
        make.top.equalTo(timeLabel.mas_bottom).offset(margin);
        make.height.width.offset(50);
    }];
    //聊天背景
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"Dialog_green.right"];
    [self.contentView addSubview:bgView];
#warning mark 代码切图
/**
    UIImage *image = [UIImage imageNamed:@"Dialog_green.right"];
    //切图  CapInsets:需要保留的四周区域  resizingMode:  Tile 拉伸,Stretch平铺
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.7, image.size.width * 0.4, image.size.height * 0.3, image.size.width * 0.6) resizingMode:UIImageResizingModeTile];
    
    bgView.image = image;
    
    //rightCap = 图片的宽 - leftCap - 1
    NSInteger leftCap = image.size.width * 0.4;
    //bottomCap = 图片的高 - topCap - 1
    NSInteger topCap = image.size.height * 0.7;
    //使用两个参数外的图片 平铺整合image
    image =[image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
    bgView.image = image;
*/
    
    
    //聊天内容
    UILabel *textView = [UILabel makeLabelWithText:@"微笑的对我说声好久不见~" andTextColor:[UIColor darkGrayColor] andTextFont:15];
    //自动换行,最大宽度
    textView.numberOfLines = 0;
    textView.preferredMaxLayoutWidth = 200;
    [self.contentView addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(iconView.mas_left).offset(-margin *3);
        make.top.equalTo(iconView.mas_top).offset(margin);
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(textView).mas_offset(UIEdgeInsetsMake(-margin, -margin, -margin, -margin * 2));
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
