//
//  TuWanViewController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"

#import "iCarousel.h"
#import "TuWanListViewController.h"

@interface TuWanViewController ()<iCarouselDelegate,iCarouselDataSource>



@end

@implementation TuWanViewController





+ (UINavigationController *)standradTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        /** 例如设置第一个控制器某个属性的值 kvc */
     //   vc setValue:[vc.values[0]] forKey:[vc.keys[0]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
});
    return navi;
}
/**  提供每个vc对应的values 数组*/
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count;i ++ ) {
        // 数值上每个vc的infoType 的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return [arr copy];
}
/**  提供每个vc对应的key值数组*/
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

+ (NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",
            @"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/**  提供每个题目对应的控制器类型，题目和类型数量必须一致*/
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    [Factory addMenuItemToVc:self];
    
   
    
    
    
}
#pragma mark - iCarouselDataSource




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
