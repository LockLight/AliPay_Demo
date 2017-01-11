//
//  LLHomeTopView.h
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLHomeTopView;

typedef enum : NSUInteger {
    LLHomeTopViewBtnScan = 1,
    LLHomeTopViewBtnPay,
    LLHomeTopViewBtnCard,
    LLHomeTopViewBtnXiu
} LLHomeTopViewBtnType;

//1.定义协议
@protocol LLHomeTopViewDelegate <NSObject>
//2.协议方法声明
@optional
- (void)homeTopView:(LLHomeTopView *)topView andBtnType:(LLHomeTopViewBtnType)type;

@end

@interface LLHomeTopView : UIView
//3.定义代理属性
@property (nonatomic, weak) id<LLHomeTopViewDelegate> delegate;
@end
