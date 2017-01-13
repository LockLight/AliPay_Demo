//
//  LLBusinessTypeFlowLayout.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/7.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessTypeFlowLayout.h"

#define colNum 4;
#define rowNum 2;
@implementation LLBusinessTypeFlowLayout
//准备布局 在collectionView前创建
- (void)prepareLayout{
    [super prepareLayout];
    
    //设置cell尺寸
    CGFloat itemW = self.collectionView.bounds.size.width / colNum;
    CGFloat itemH = self.collectionView.bounds.size.height / rowNum;
    self.itemSize = CGSizeMake(itemW, itemH);
    //设置cell最小行列间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    //设置水平滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置滚动条隐藏
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //设置分页效果
    self.collectionView.pagingEnabled = YES;
    //禁用弹簧
    self.collectionView.bounces = NO;
}
@end
