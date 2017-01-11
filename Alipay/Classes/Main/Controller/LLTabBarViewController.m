//
//  LLTabBarViewController.m
//  Alipay
//
//  Created by locklight on 17/1/10.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLTabBarViewController.h"
#import "UIColor+Addition.h"
#import "LLNaviViewController.h"

@interface LLTabBarViewController ()

@end

@implementation LLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子控制器
    UIViewController *v1 = [self makeChildViewControllerWithClassName:@"LLHomeViewController" andImage:@"TabBar_HomeBar" andTitle:@"生活"];
    UIViewController *v2 = [self makeChildViewControllerWithStoryBoardName:@"LLBusiness" andImage:@"TabBar_Businesses" andTitle:@"口碑"];
    UIViewController *v3 = [self makeChildViewControllerWithClassName:@"LLFriendViewController" andImage:@"TabBar_Friends" andTitle:@"朋友"];
    UIViewController *v4 = [self makeChildViewControllerWithClassName:@"LLMineViewController" andImage:@"TabBar_Assets" andTitle:@"我的"];
    //添加子控制器
    self.viewControllers = @[v1,v2,v3,v4];
    
    //设置便签页主题颜色
    self.tabBar.tintColor = [UIColor colorWithHex:0x2e90d4];
    
    //禁用标签栏透明效果,影响tabBar子空间View的大小
    self.tabBar.translucent = NO;
}

/**
 返回一个快速创建的子控件控制器
 
 @param className 子控制器类名的字符串
 @param imageName 子控制器图片
 @param title 子控制器标题
 */
- (UIViewController *)makeChildViewControllerWithClassName:(NSString *)className andImage:(NSString *)imageName andTitle:(NSString *)title{
    //把字符串转化为类名
    Class class = NSClassFromString(className);
    //创建子控件
    UIViewController *viewC = [[class alloc]init];
//    //设置标题
//    viewC.tabBarItem.title = title;
    //设置图片
    viewC.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置选中图片
    NSString *selImage = [imageName stringByAppendingString:@"_Sel"];
    //选中状态关闭渲染
    viewC.tabBarItem.selectedImage = [[UIImage imageNamed:selImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //创建导航栏并设置当前标签控制器为其根控制器
    LLNaviViewController *nav = [[LLNaviViewController alloc]initWithRootViewController:viewC];
//    //设置导航栏标题
//    nav.title = title;
    //同时设置标签,导航控制器标题
    viewC.title = title;
    
//    viewC.view.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return nav;
}

//通过SB快速创建
- (UIViewController *)makeChildViewControllerWithStoryBoardName:(NSString *)sbName andImage:(NSString *)imageName andTitle:(NSString *)title{
    //创建SB
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    //加载SB中的控制器初始化
    UIViewController *viewC = [sb instantiateInitialViewController];
    //    //设置标题
    //    viewC.tabBarItem.title = title;
    //设置图片
    viewC.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置选中图片
    NSString *selImage = [imageName stringByAppendingString:@"_Sel"];
    //选中状态关闭渲染
    viewC.tabBarItem.selectedImage = [[UIImage imageNamed:selImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //创建导航栏并设置当前标签控制器为其根控制器
    LLNaviViewController *nav = [[LLNaviViewController alloc]initWithRootViewController:viewC];
    //    //设置导航栏标题
    //    nav.title = title;
    //同时设置标签,导航控制器标题
    viewC.title = title;
    
    //    viewC.view.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return nav;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
