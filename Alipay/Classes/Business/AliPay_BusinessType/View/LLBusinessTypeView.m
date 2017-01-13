//
//  LLBusinessTypeView.m
//  AliPay_商品分类Demo
//
//  Created by locklight on 17/1/9.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessTypeView.h"
#import "Masonry.h"
#import "LLBusinessTypeFlowLayout.h"
#import "LLBusinessType.h"
#import "LLBussnissTypeCell.h"

static NSString *ID = @"businessType";
@interface LLBusinessTypeView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation LLBusinessTypeView

//xib初始化
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

//class初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //创建商家分类页面
    [self makecollectionView];
    //创建分页显示器
    [self makePageControl];
}

//创建分类页面
- (void)makecollectionView{
    LLBusinessTypeFlowLayout *flowLayout =[[LLBusinessTypeFlowLayout alloc]init];
    //创建视图
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    //设置collectionView背景色
    collectionView.backgroundColor = [UIColor whiteColor];
    //添加到父控件
    [self addSubview:collectionView];
    
    //设置视图约束
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(150);
    }];
    //设置数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //注册cell
    [collectionView registerClass:[LLBussnissTypeCell class] forCellWithReuseIdentifier:ID];
    
    _collectionView = collectionView;
}

- (void)makePageControl{
    //创建分页显示器
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.numberOfPages = 2;
    [self addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(_collectionView.mas_bottom).offset(0);
    }];
    
    _pageControl = pageControl;
}

#pragma mark    代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x /scrollView.bounds.size.width + 0.4999;
    _pageControl.currentPage = page;
}


#pragma mark 数据源方法
//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


//每组有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.businessTypeData.count;
}
//item中cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    LLBussnissTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //设置cell内子控件数据
    cell.businessType = self.businessTypeData[indexPath.item];
    //返回cell
    return cell;
}
@end
