//
//  RankListViewController.h
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListViewController : UIViewController

/**  用单例的原因 ： 侧边栏需要经常切换内容页 ，内容也不应该睡着切换而被释放掉，每次切换都应该是同一个内存地址*/
+ (UINavigationController *)defaultnavi;

@end
