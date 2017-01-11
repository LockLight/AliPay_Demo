//
//  LLHomeViewController.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLHomeViewController.h"
#import "LLHomeTopView.h"
#import "Masonry.h"
#import "UIColor+Addition.h"

@interface LLHomeViewController ()<LLHomeTopViewDelegate>

@end

@implementation LLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //四个按钮的View
    LLHomeTopView *topView= [[LLHomeTopView alloc]init];
    topView.backgroundColor = [UIColor colorWithHex:0x2e90d4];
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.equalTo(topView.mas_width).multipliedBy(115/ 375.0);
    }];
    //功能列表界面的View
    UIView *funcListView  = [[UIView alloc]init];
    funcListView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:funcListView];
    
    //设置代理
    topView.delegate = self;
    
    [funcListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(0);
    }];
}

- (void)homeTopView:(LLHomeTopView *)topView andBtnType:(LLHomeTopViewBtnType)type{
    switch (type) {
        case LLHomeTopViewBtnScan:{
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case LLHomeTopViewBtnPay:{
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case LLHomeTopViewBtnCard:{
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
        case LLHomeTopViewBtnXiu:{
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor yellowColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

////隐藏当前View的状态栏
//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
///*

@end
