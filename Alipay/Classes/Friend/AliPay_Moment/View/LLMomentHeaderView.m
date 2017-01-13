//
//  LLMomentHeaderView.m
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMomentHeaderView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"

@implementation LLMomentHeaderView

//获取当前屏幕尺寸
+ (instancetype)headerView{
    return [[self alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor yellowColor];
    //局部变量,默认间距
    CGFloat margin = 8 ;
    //设置现场label
    //    UILabel *sceneLabel = [[UILabel alloc]init];
    //    sceneLabel.text = @"现场";
    //    sceneLabel.textColor = [UIColor darkGrayColor];
    //    sceneLabel.font = [UIFont systemFontOfSize:14];
    UILabel *sceneLabel = [UILabel makeLabelWithText:@"现场" andTextColor:[UIColor darkGrayColor] andTextFont:14];
    [self addSubview:sceneLabel];
    
    [sceneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(margin);
        make.top.equalTo(self.mas_top).offset(margin);
    }];
    //设置图片
    UIImageView *picView = [[UIImageView alloc]init];
    picView.image = [UIImage imageNamed:@"default_nearby_scene"];
    [picView sizeToFit];
    [self addSubview:picView];
    
    [picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sceneLabel.mas_left).offset(0);
        make.top.equalTo(sceneLabel.mas_bottom).offset(margin);
        make.right.equalTo(self.mas_right).offset(-margin);
        //宽高比  自适应后的宽度是高度的多少倍
        make.height.equalTo(picView.mas_width).multipliedBy(picView.bounds.size.height / picView.bounds.size.width);
    }];
    //设置朋友圈label
    //    UILabel *friendLabel = [[UILabel alloc]init];
    //    friendLabel.text = @"朋友圈";
    //    friendLabel.textColor = [UIColor darkGrayColor];
    //    friendLabel.font = [UIFont systemFontOfSize:14];
    UILabel *friendLabel = [UILabel makeLabelWithText:@"生活圈" andTextColor:[UIColor darkGrayColor] andTextFont:14];
    [self addSubview:friendLabel];
    
    [friendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(picView.mas_left).offset(0);
        make.top.equalTo(picView.mas_bottom).offset(margin);
    }];
    
    
    //提前更新当前View的frame
    [self layoutIfNeeded];
    //重新设置headerView的frame
    self.frame = CGRectMake(0, 0, 0, CGRectGetMaxY(friendLabel.frame) +  margin);
    
}
@end
