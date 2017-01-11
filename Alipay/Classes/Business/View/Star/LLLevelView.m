//
//  LLLevelView.m
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/4.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLLevelView.h"

#define StarCount  5
@implementation LLLevelView

#warning mark 通过xib或SB调用时的初始化方法
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        for (NSInteger i = 0; i < StarCount; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"full_star"]];
            imageView.frame = CGRectOffset(imageView.bounds, imageView.bounds.size.width, 0);
            [self addSubview:imageView];
        }
    }
    return self;
}

# warning mark 通过代码coder创建时调用的初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        for (NSInteger i = 0; i < StarCount; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"full_star"]];
            imageView.frame = CGRectOffset(imageView.bounds, imageView.bounds.size.width, 0);
            [self addSubview:imageView];
        }
    }
    return self;
}


- (void)setLevel:(CGFloat)level{
    //根据level的数组展示对应的星星数量
    _level = level;
    
    //将接收到的浮点数强转为整数,fullStarCount表示满星的个数
    NSInteger fullStarCount = (NSInteger)level;
    
    //设置满星View
    for(NSInteger i = 0;i < fullStarCount; i++){
        [self makeLevelWithImageName:@"full_star" starPosition:i];
    }
    //设置半星View
    if(level - fullStarCount > 0){
        [self makeLevelWithImageName:@"half_star" starPosition:fullStarCount];
        //设置半星后++,
        fullStarCount++;
    }
    //设置空星View
    for (NSInteger i = fullStarCount ; i < StarCount; i++) {
        [self makeLevelWithImageName:@"empty_star" starPosition:i];
    }
}

- (void)makeLevelWithImageName:(NSString *)imageName starPosition:(NSInteger)position{
    UIImageView *imageView = self.subviews[position];
    imageView.image = [UIImage imageNamed:imageName];
}

@end
