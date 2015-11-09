//
//  TuWanViewController.h
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"



@interface TuWanViewController : WMPageController


// 内容页的首页应该是单例的，每次进程都初始化一次
+ (UINavigationController *)standradTuWanNavi;


@end
