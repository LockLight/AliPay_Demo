//
//  LLChatViewController.m
//  Alipay
//
//  Created by locklight on 17/1/13.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLChatViewController.h"
#import "NSArray+Addition.h"
#import "Masonry.h"
#import "LLChatViewCell.h"
#import "LLChat.h"
#import "LLChatOtherTableViewCell.h"

//重用标识
static NSString *chatID = @"chatID";
static NSString *chatOtherID = @"chatOtherID";

@interface LLChatViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *chatData;
@end

@implementation LLChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    self.chatData = [self loadChatData];
    //设置聊天表格视图
    [self setChatTableView];
    //设置底部聊天输入框
    [self setChatBottomBar];
    //监听系统键盘事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)KeyboardWillChangeFrameNotification:(NSNotification *)notice{
    //    NSLog(@"%@", note.userInfo);
    //1. 获取键盘信息
    NSDictionary *keyBoardInfo = notice.userInfo;
    // 2.取出键盘变化后的frame
    CGRect keyBoardFrame = [keyBoardInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 3.计算控制器view要移动的距离
    
    CGFloat transformY = keyBoardFrame.origin.y - self.view.bounds.size.height - 64;
    // 4.移动控制器的view
    self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
}

- (void)delloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)setChatBottomBar{
    //创建模糊效果
    UIBlurEffect *blur  = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //创建高斯模糊的View
    UIVisualEffectView *bottomBar = [[UIVisualEffectView alloc]initWithEffect:blur];
    [self.view addSubview:bottomBar];
    
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(44);
    }];
    
    //创建文本输入框
    UITextField *sendText = [[UITextField alloc]init];
    sendText.borderStyle = UITextBorderStyleRoundedRect;
    [bottomBar.contentView addSubview:sendText];
    
    [sendText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.centerY.offset(0);
    }];
    
    //创建发送按钮
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [bottomBar.contentView addSubview:sendBtn];
    
    [sendBtn sizeToFit];
    [sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-8);
        make.centerY.equalTo(sendText.mas_centerY).offset(0);
        make.left.equalTo(sendText.mas_right).offset(8);
        make.width.offset(sendBtn.bounds.size.width);
    }];
}

- (void)setChatTableView{
    //创建表格
    UITableView *chatVc = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:chatVc];
    
    //设置数据源
    chatVc.dataSource = self;
    chatVc.delegate = self;
    //约束
    [chatVc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 44, 0));
    }];
    
    //注册Cell
    [chatVc registerClass:[LLChatViewCell class] forCellReuseIdentifier:chatID];
    [chatVc registerClass:[LLChatOtherTableViewCell class] forCellReuseIdentifier:chatOtherID];
    //预估行高
    chatVc.estimatedRowHeight = 200;
    //取消分割线
    chatVc.separatorStyle = UITableViewCellSeparatorStyleNone;
    //不允许选中cell
    chatVc.allowsSelection = NO;
    //修改tableView背景色
    chatVc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //    //拖拽tableView退出键盘
    //    chatVc.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

#pragma mark 代理方法 拖动tableView时退出编辑
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chatData.count;
}
//每个cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出每一行cell的模型
    LLChat *chat = self.chatData[indexPath.row];
    //自己发送消息的cell
    if(chat.type == LLChatTypeMe){
    //创建cell
    LLChatViewCell *cell = [tableView dequeueReusableCellWithIdentifier:chatID forIndexPath:indexPath];
//    //设置选中cell的样式
//    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    //设置数据
    cell.chat  = chat;    //返回
    return cell;
    }
    //其他人发送消息的cell
    LLChatOtherTableViewCell *otherCell = [tableView dequeueReusableCellWithIdentifier:chatOtherID forIndexPath:indexPath];
    otherCell.chat = chat;
    return otherCell;
}
#pragma mark 加载聊天信息数据  并对信息时间判断后去重
- (NSArray *)loadChatData{
    NSArray *chatArr = [NSArray objectListWithPlistName:@"Chats.plist" clsName:@"LLChat"];
    //定义 上一条消息的时间
    NSString *preMsgTime = nil;
    //遍历模型数据,做时间判断
    for (LLChat *chat in chatArr) {
        //如当前消息时间与上一条消息时间一致
        if([chat.time isEqualToString:preMsgTime]){
            chat.time = nil;
        }else{
            preMsgTime = chat.time;
        }
    }
    return chatArr;
}
@end
