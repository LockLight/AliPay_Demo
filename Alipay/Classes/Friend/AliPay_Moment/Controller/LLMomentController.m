//
//  LLMomentController.m
//  AliPay_Moment_Demo
//
//  Created by locklight on 17/1/6.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLMomentController.h"
#import "LLMomentHeaderView.h"
#import "LLMoment.h"
#import "LLMomentCell.h"

//定义重用标识
static NSString *ID = @"moment";

@interface LLMomentController ()
@property (nonatomic, strong) NSArray *momentData;
@end

@implementation LLMomentController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加头部视图
    self.tableView.tableHeaderView = [LLMomentHeaderView headerView];
    //加载数据
    _momentData = [self loadMomentData];
    //注册cell
    [self.tableView registerClass:[LLMomentCell class] forCellReuseIdentifier:ID];
//    //设置统一行高
//    self.tableView.rowHeight = 300;
    //设置预估行高,降低计算真实行高的优先级
    self.tableView.estimatedRowHeight = 400;
//    //设置系统分割线颜色
//    self.tableView.separatorColor = [UIColor blueColor];
    //设置分割线隐藏
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
//    //设置分割线与父控件左对齐
//    self.tableView.separatorInset = UIEdgeInsetsZero;
}
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.momentData.count;
}
//每行cell显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    LLMomentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    //设置cell
    cell.moment = self.momentData[indexPath.row];
    //返回
    return cell;
}
//加载plist数据
- (NSArray *)loadMomentData{
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Moment.plist" withExtension:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        [arrM addObject:[LLMoment momentWithDict:dict]];
    }
    return arrM.copy;
}
@end
