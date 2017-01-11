//
//  LLHomeTopView.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLHomeTopView.h"
#import "Masonry.h"
#import "NSAttributedString+Additon.h"
#import "UIColor+Addition.h"

@implementation LLHomeTopView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self  setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //设置HomeTopView的背景色
    self.backgroundColor = [UIColor colorWithHex:0x2e90d4];
    
    //创建
    [self makeHomeTopViewBtnWithBtnTitle:@"扫一扫" andimage:@"home_scan" andBtnType:LLHomeTopViewBtnScan];
    [self makeHomeTopViewBtnWithBtnTitle:@"付款" andimage:@"home_pay" andBtnType:LLHomeTopViewBtnPay];
    [self makeHomeTopViewBtnWithBtnTitle:@"卡券" andimage:@"home_card" andBtnType:LLHomeTopViewBtnCard];
    [self makeHomeTopViewBtnWithBtnTitle:@"咻一咻" andimage:@"home_xiu" andBtnType:LLHomeTopViewBtnXiu];
    
    // 可以用subViews它子控件一次性去添加约束
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    // 0  1  2
    for (NSInteger i = 0; i < self.subviews.count - 1; i++) {
        
        // 1.当前的按钮
        UIButton *currentBtn = self.subviews[i];
        // 2.下一个按钮
        UIButton *nextBtn = self.subviews[i + 1];
        
        // 扫一扫
        if (i == 0) {
            [currentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(0);
            }];
        }
        
        // 咻一咻加约束 4 - 2
        if (i == self.subviews.count - 2) {
            [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(0);
            }];
        }
        
        // 下一个按钮参照前面一个控件去加约束
        [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(currentBtn.mas_right).offset(0);
            make.width.equalTo(currentBtn.mas_width).offset(0);
        }];
        
    }
//    [scan mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//    }];
//    
//    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(scan.mas_right).offset(0);
//        make.width.equalTo(scan.mas_width).offset(0);
//    }];
//    
//    [card mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(pay.mas_right).offset(0);
//        make.width.equalTo(pay.mas_width).offset(0);
//    }];
//    
//    [xiu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(card.mas_right).offset(0);
//        make.width.equalTo(card.mas_width).offset(0);
//        make.right.offset(0);
//    }];
//    
}

/**
 快速创建按钮

 @param title 按钮标题
 @param image 按钮图片
 */
- (UIButton *)makeHomeTopViewBtnWithBtnTitle:(NSString *)title andimage:(NSString *)image andBtnType:(LLHomeTopViewBtnType)type{
    //创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    //设置富文本
    NSAttributedString *aStr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:image] imageWH:35 title:title fontSize:15 titleColor:[UIColor whiteColor] spacing:7];
    //给按钮属性设置富文本
    [btn setAttributedTitle:aStr forState:UIControlStateNormal];
    //设置换行
    btn.titleLabel.numberOfLines = 0;
    //文字居中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:btn];
    
    [btn addTarget:self action:@selector(homeTopViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置tag
    btn.tag = type;
    
    return btn;
}

- (void)homeTopViewBtnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(homeTopView:andBtnType:)]) {
        [self.delegate homeTopView:self andBtnType:btn.tag];
    }
}

@end
