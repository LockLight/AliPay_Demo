//
//  LLMineFlowLayout.m
//  Alipay
//
//  Created by locklight on 17/1/15.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMineFlowLayout.h"

@implementation LLMineFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    //最小列间距
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 1 / [UIScreen mainScreen].scale;
    
    //设置最小组边距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 20, 0);
}

@end
