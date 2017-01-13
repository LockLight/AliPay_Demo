//
//  LLBussnissTypeCell.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/7.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBussnissTypeCell.h"
#import "LLBusinessType.h"
#import "Masonry.h"
#import "UILabel+Addition.h"

@interface LLBussnissTypeCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;


@end

@implementation LLBussnissTypeCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //默认间距
    CGFloat margin = 8;
    //创建图标
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.image = [UIImage imageNamed:@"bus"];
    [self addSubview:iconView];
    
    //设置图标约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(margin);
        make.centerX.offset(0);
        make.width.height.offset(30);
    }];
    
    //创建名称
//    UILabel *nameLabel = [UILabel makeLabelWithText:@"物流" andTextColor:[UIColor darkGrayColor] andTextFontSize:15];
    UILabel *nameLabel = [UILabel makeLabelWithText:@"物流" andTextColor:[UIColor darkGrayColor] andTextFont:15];
    [self addSubview:nameLabel];
    
    //设置名称约束
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-margin);
    }];
    //赋值
    _iconView = iconView;
    _nameLabel = nameLabel;
}

-(void)setBusinessType:(LLBusinessType *)businessType{
    //传递模型数据
    _businessType = businessType;
    
    _iconView.image = [UIImage imageNamed:businessType.icon];
    _nameLabel.text = businessType.name;
}
@end
