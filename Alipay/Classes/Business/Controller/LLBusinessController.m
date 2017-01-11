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

@interface LLBusinessController ()
@property (nonatomic, strong) NSArray *businessData; 
@end

@implementation LLBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载模型数据
    _businessData = [self loadBusinessData];
    //加载头部广告视图
    self.tableView.tableHeaderView  = [self makeTopPic];
    //加载尾部视图
    self.tableView.tableFooterView  = [self makeFooterBtn];
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

#pragma mark - 加载数据
- (NSArray *)loadBusinessData {
    //
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"business.plist" withExtension:nil]];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[LLBusinessModel businessWithDict:dict]];
    }
    return arrM.copy;
}
//设置头部广告图片
- (UIView *)makeTopPic{
    LLBusinessTopPic *topPic = [LLBusinessTopPic businessTopPicWithNib];
    //宽高比   375 *850 /320
    CGFloat picH = self.view.bounds.size.width * topPic.bounds.size.height / topPic.bounds.size.width;
    topPic.frame = CGRectMake(0, 0, 0, picH);
    
    return topPic;
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
@end
