//
//  LLNaviViewController.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLNaviViewController.h"
#import "UIColor+Addition.h"

@interface LLNaviViewController ()

@end

@implementation LLNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航条以及状态栏的背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithHex:0x2e90d4];

    //创建阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    //设置导航条标题
    /* You may specify the font, text color, and shadow properties for the title in the text attributes dictionary, using the keys found in NSAttributedString.h.
     */
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor],NSShadowAttributeName:shadow};
#pragma mark 组合使用可透明导航栏
    //清空导航条自带的背景图片
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //清空导航栏自带阴影
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //关闭透明效果
    self.navigationBar.translucent = NO;
    
}
//
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
////导航控制器无法设置状态栏的隐藏
//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}
////设置状态栏权限交给栈顶,修改各个状态栏状态由各页面的控制器实现
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}
///
#pragma mark  导航栏push新视图,隐藏标签栏操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //隐藏
    if(self.viewControllers.count  > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //执行系统push方法,将子控制器添加至导航栏
    [super pushViewController:viewController animated:animated];
}


@end
