//
//  LLBusinessController.m
//  AliPay-口碑页面Demo
//
//  Created by locklight on 17/1/4.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLBusinessController.h"
#import "LLBusinessModel.h"
#import "LLBusinessCell.h"
#import "LLBusinessTopPic.h"
#import "LLBusinessType.h"
#import "LLBusinessTypeView.h"
#import "NSArray+Addition.h"
#import "LLBusinessTopPic.h"
#import "Masonry.h"

@interface LLBusinessController ()
@property (nonatomic, strong) NSArray *businessData; 
@end

@implementation LLBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载模型数据
    _businessData = [self loadBusinessData];
    //创建view包含商家分类以及头部广告
    UIView *headerView = [[UIView alloc]init];
    //创建商家分类View
    LLBusinessTypeView *typeView = [[LLBusinessTypeView alloc]init];
    typeView.businessTypeData = [self loadBusinessTypeData];
//    //加载头部广告视图
//    self.tableView.tableHeaderView  = [self makeTopPic];
//    //加载尾部视图
//    self.tableView.tableFooterView  = [self makeFooterBtn];
    
    //创建头部广告
    LLBusinessTopPic *topPic =[LLBusinessTopPic businessTopPicWithNib];
    
    //将两个视图添加到头部视图中
    [headerView addSubview:typeView];
    [headerView addSubview:topPic];
    
    //将tableView的顶部视图设置为headerView
    self.tableView.tableHeaderView = headerView;
    
    //给商家分类添加约束
    [typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(180);
    }];
    //给广告添加约束
    [topPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(typeView.mas_bottom).offset(0);
        make.height.equalTo(topPic.mas_width).multipliedBy(topPic.bounds.size.height / topPic.bounds.size.width);
    }];
    
    //立即根据约束更新frame
    [headerView layoutIfNeeded];
    
    //设置headerView的frame
    headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width,CGRectGetMaxY(topPic.frame));
    
    //设置尾部视图
    [self makeFooterBtn];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - Table view data source


//只有一组可以不实现
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 1;
//}

//一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _businessData.count;
}

//显示cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    LLBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"business" forIndexPath:indexPath];
    //设置cell内容
    cell.businessModel = self.businessData[indexPath.row];

    return cell;
}
//设置cell组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"热门推荐";
}



//设置尾部按钮
- (UIButton *)makeFooterBtn{
    UIButton *footerBtn = [[UIButton alloc]init];
    //设置按钮标题
    [footerBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    //设置按钮标题在不同状态下点击颜色
    [footerBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [footerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    //设置按钮背景颜色
    footerBtn.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    //按钮frame
    footerBtn.frame = CGRectMake(0, 0, 0, 30);

    return footerBtn;
}

#pragma mark - 加载商家分类数据
- (NSArray *)loadBusinessTypeData{
    return [NSArray objectListWithPlistName:@"businessType.plist" clsName:@"LLBusinessType"];
}

#pragma mark - 加载cell数据
- (NSArray *)loadBusinessData {
    //
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"business.plist" withExtension:nil]];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[LLBusinessModel businessWithDict:dict]];
    }
    return arrM.copy;
}
@end
