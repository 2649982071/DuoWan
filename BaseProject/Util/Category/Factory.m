
//
//  Factory.m
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+ (void)addMenuItemToVc:(UIViewController *)vc
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:btn];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //   使用弹簧控件缩小菜单按钮和边远距离
    UIBarButtonItem *spaceitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceitem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceitem,menuItem];

}
@end
