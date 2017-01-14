//
//  LLFriendViewController.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLFriendViewController.h"
#import "NSArray+Addition.h"
#import "LLFriendCell.h"
#import "LLMomentController.h"
#import "LLChatViewController.h"


//cell标识
static NSString *sectionOneID = @"sectionOneID";
static NSString *sectionTwoID = @"sectionTwoID";
@interface LLFriendViewController ()
@property (nonatomic, strong) NSArray *friendsData;
@end

@implementation LLFriendViewController

//更改tableViewCell样式  需要重写初始化方法
- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    self.friendsData = [self loadFriendsData];
    //1.注册系统样式Cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:sectionOneID];
    //加载xib
    UINib *xib = [UINib nibWithNibName:@"LLFriendCell" bundle:nil];
    //2.注册第1组Cell
    [self.tableView registerNib:xib forCellReuseIdentifier:sectionTwoID];
    
    //实例化xib
    LLFriendCell *cell =[[xib instantiateWithOwner:nil options:nil]firstObject];
    //设置行高
    self.tableView.rowHeight = cell.bounds.size.height;
    //设置分割线从最左开始
    self.tableView.separatorInset = UIEdgeInsetsZero;
    //创建返回按钮
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    //设置返回按钮
    self.navigationItem.backBarButtonItem = backBtn;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //动画选择取消
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //调整至生活圈界面
    if(indexPath.section == 0){
        //创建生活圈界面
        LLMomentController *momentVc = [[LLMomentController alloc]init];
        //设置导航栏标题
        momentVc.navigationItem.title = @"生活圈";
//        //隐藏生活圈界面标签栏
//        momentVc.hidesBottomBarWhenPushed = YES;
        //显示
        [self.navigationController pushViewController:momentVc animated:YES];

    }
    if(indexPath.row == 2){
        //创建聊天界面
        LLChatViewController *chatVc = [[LLChatViewController alloc]init];
        //设置背景色
        chatVc.view.backgroundColor = [UIColor lightGrayColor];
        //显示
        [self.navigationController pushViewController:chatVc animated:YES];
    }
}

//group样式时,需要让第0组cell紧贴父控件 需要高度设为0.1  返回 1 标识高度自适应
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:
    (NSInteger)section{
    return 0.1;
}

#pragma mark  数据源方法
//返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return  1;
    }
    return self.friendsData.count;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        //创建cell
        LLFriendCell *firstCell = [tableView dequeueReusableCellWithIdentifier:sectionOneID forIndexPath:indexPath];
        //设置数据
        firstCell.imageView.image = [UIImage imageNamed:@"APC_timeLineIcon"];
        firstCell.textLabel.text = @"生活圈";
        //设置cell辅助器
        firstCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //返回
        return firstCell;
    }
    LLFriendCell *friendCell = [tableView dequeueReusableCellWithIdentifier:sectionTwoID forIndexPath:indexPath];
    friendCell.friendData = self.friendsData[indexPath.row];
    return friendCell;
}

- (NSArray *)loadFriendsData{
    return [NSArray objectListWithPlistName:@"Friends.plist" clsName:@"LLFriend"];
}

@end
