//
//  LLMineViewController.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMineViewController.h"
#import "LLMineFlowLayout.h"
#import "NSArray+Addition.h"
#import "LLMineOptionCell.h"

//第一组 5个
#define KFirstSectionCount 5
//第二组 4个
#define KSecondSectionCount 4
//第三组 6个
#define KThirdSectionCount 6

//个人信息的cell标识
static NSString *KInfoCellID = @"KInfoCellID";
//余额的cell标识
static NSString *KBalanceCellID = @"KBalanceCellID";
//其他cell标识
static NSString *KOptionCellID = @"KOptionCellID";

@interface LLMineViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray  *mineOptionsData;
@end

@implementation LLMineViewController

//重写初始化方法 ,自定义流布局
- (instancetype)init{
    //创建流布局对象
    LLMineFlowLayout *flowLayout = [[LLMineFlowLayout alloc]init];
    return [super initWithCollectionViewLayout:flowLayout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    self.mineOptionsData = [self loadMineOptionsData];
    //设置CollectionView背景色
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //注册info cell
    UINib *infoNib = [UINib nibWithNibName:@"LLMineInfoCell" bundle:nil];
    [self.collectionView registerNib:infoNib forCellWithReuseIdentifier:KInfoCellID];
    
    //注册balance cell
    UINib *balanceNib = [UINib nibWithNibName:@"LLMineBalanceCell" bundle:nil];
    [self.collectionView registerNib:balanceNib forCellWithReuseIdentifier:KBalanceCellID];
    
    //注册option cell
    UINib *optionNib = [UINib nibWithNibName:@"LLMineOptionCell" bundle:nil];
    [self.collectionView registerNib:optionNib forCellWithReuseIdentifier:KOptionCellID];
}

#pragma mark 数据源方法
//返回组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
//每组几个格子
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){  //第0组一个格子
        return 1;
    }else if (section == 1){  //第1组5个格子
        return KFirstSectionCount;
    }else if (section == 2){  //第2组4个格子
        return KSecondSectionCount;
    }
    //第3组6个格子
    return KThirdSectionCount;
}
//每个格子的cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //第0组的cell
    if(indexPath.section == 0){
        return [collectionView dequeueReusableCellWithReuseIdentifier:KInfoCellID forIndexPath:indexPath];
    }
    //余额cell
    if(indexPath.section == 0 && indexPath.item == 0){
        return [collectionView dequeueReusableCellWithReuseIdentifier:KBalanceCellID forIndexPath:indexPath];
    }
    //其他cell
    LLMineOptionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KOptionCellID forIndexPath:indexPath];
    if(indexPath.section == 1){  //第一组cell
        cell.mineOption = self.mineOptionsData[indexPath.item - 1];
    }else if (indexPath.section == 2){ //第二组cell
        cell.mineOption = self.mineOptionsData[indexPath.item + KFirstSectionCount -1];
    }else{                       // 第三组cell
        cell.mineOption = self.mineOptionsData[indexPath.item + KFirstSectionCount -1 + KSecondSectionCount];
    }
    //返回其他cell
    return  cell;
}
//返回每个格子的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //collectionView的宽
    CGFloat collectionViewW = collectionView.bounds.size.width;
    if(indexPath.section == 0){
        //返回第0组cell尺寸
        return CGSizeMake(collectionViewW, 100);
    }
    //第一组第0个cell尺寸
    if(indexPath.section == 1 && indexPath.item == 0){
        return CGSizeMake(collectionViewW, 68);
    }
    //其他cell尺寸
    CGFloat itemW = (collectionViewW -1 / [UIScreen mainScreen].scale) *0.5 ;
    return CGSizeMake(itemW, 68);
}

//加载数据
- (NSArray *)loadMineOptionsData{
    return [NSArray objectListWithPlistName:@"MineOption.plist" clsName:@"LLMineOption"];
}

@end
