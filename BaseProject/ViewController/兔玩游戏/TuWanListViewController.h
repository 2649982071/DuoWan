//
//  TuWanListViewController.h
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanViewModel.h"

@interface TuWanListViewController : UITableViewController

/** 接受外部传参，决定到你跟前控制器 显示那种类型的信息 */

 
@property(nonatomic,strong)NSNumber *infoType;


@end
