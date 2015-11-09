//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "DuoWanTabBarController.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
#import "RankListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        [_window makeKeyAndVisible];
        _window.backgroundColor = [UIColor whiteColor];
    }
    return _window;
}

- (RESideMenu *)sideMedu
{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standradTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
//      出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
    }
    return _sideMenu;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    
    
    
        self.sideMedu.backgroundImage = [UIImage imageNamed:@"10941686_0800"];
//    可以让出现菜单时，不显示状态栏
  //  self.window.rootViewController = self.sideMenu;
    self.window.rootViewController = [RankListViewController defaultnavi];
  
    // 配置全局UI样式
    [self configGlobalUIStyle];
    return YES;
}

/** 配置全局UI的样式 */
- (void)configGlobalUIStyle
{
    /**  导航栏不透明 */
    [[UINavigationBar appearance]setTranslucent:NO];
    // 设置导航栏背景图
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    // 配置导航栏题目的样式
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:KNaviTitleFontSize,NSForegroundColorAttributeName:kNaviTitleColor}];
}
@end
