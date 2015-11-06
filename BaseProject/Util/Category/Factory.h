//
//  Factory.h
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/**  像某个控制器上添加菜单按钮 */
+ (void)addMenuItemToVc:(UIViewController *)vc;

/**  向某个控制器上添加返回按钮*/

+ (void)addBackItemToVC:(UIViewController *)vc;
@end
