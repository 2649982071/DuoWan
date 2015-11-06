//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanRequestPath.h"

//很多具有共同点的东西，可以统一宏定义，比如
//凡是自己写的宏定义 都需要用k开头，这是编码习惯
#define kOSType       @"OSType":[@"iOS" stringByAppendingString:[UIDevice \
currentDevice].systemVersion] //9.1是当前手机系统版本，需要到info文件中去取
#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140
//把path写到文件头部，使用宏定义形势。 方便后期维护


@implementation DuoWanNetManager

// 周免
+ (id)getFreeHeroForCompletionHandle:(void (^)(FreeHeroModel *, NSError *))completionHandle
{
    return [self GET:kHeroPath parameters:@{@"type":@"free",kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
    }];
}
// 全部英雄
+ (id)getAllHeroForCompletionHandle:(void (^)(AllHeroModel *, NSError *))completionHandle
{
    return [self GET:kHeroPath parameters:@{@"type":@"all",kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
    }];
}
// 获取英雄皮肤
+ (id)getHeroSkinForHero:(NSString *)hero completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroSkinPath parameters:@{@"hero":hero,kV,kOSType,kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
// 英雄配音
+ (id)getHeroSoundForHero:(NSString *)hero completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroSoundPath parameters:@{kV,kOSType,kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj,error);
    }];
}
// 英雄视频
+ (id)getHeroViedoWithPage:(NSInteger)page tag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroVideoPath parameters:@{@"action":@"l",@"p":@(page),kV,kOSType,@"tag":tag,@"src":@"letv"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄出装
+ (id)getHeroCZForHero:(NSString *)hero completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroCZPath parameters:@{@"championName":hero,@"limit":@7,kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//英雄资料
+ (id)getHeroDetailForHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroDetailPath parameters:@{kOSType,@"heroName":heroName,kV} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroDetailModel objectWithKeyValues:responseObj],error);
    }];
}
// 天赋符文
+(id)getHeroGiftForHero:(NSString *)hero completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kGiftAndRunPath parameters:@{@"hero":hero,kOSType,kV} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel objectWithKeyValues:responseObj],error);
    }];
}

// 英雄改动
+ (id)getHeroChangeForHero:(NSString *)hero completionHandle:(void (^)(HeroChangeModel *, NSError *))completionHandle
{
    return [self GET:kHeroInfoPath parameters:@{@"name":hero,kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj],error);
    }];
}
// 一周数据
+ (id)getHeroWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(HeroWeekDataModel *, NSError *))completionHandle
{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId":@(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj],error);
    }];
}
// 游戏百科列表
+ (id)getToolMenuCompletionHandle:(void (^)(NSArray *, NSError *))completionHandle
{
    return [self GET:kToolMenuPath parameters:@{@"category":@"database",kV,kVersionName,kOSType} completionHandler:^(NSArray *responseObj, NSError *error) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObj) {
            ToolMenuModel *model = [ToolMenuModel objectWithKeyValues:dic];
            [arr addObject:model];
        }
        
        completionHandle([arr copy],error);
    }];
}
// 装备分类
+ (id)getZBCategoryCompletionHandle:(void (^)(NSArray *, NSError *))completionHandle{
    return [self GET:kZBCategoryPath parameters:@{kV,kVersionName,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//  某分类装备列表
+ (id)getZBItemForTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kZBItemListPath parameters:@{@"tag":tag,kV,kVersionName,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
// 装备详情
+ (id)getZBItemDetailForID:(NSInteger)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kItemDetailPath parameters:@{@"id":@(ID),kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj],error);
    }];
}
// 天赋
+ (id)getGiftCompletionHandle:(void (^)(GiftModel *, NSError *))completionHandle
{
    return [self GET:kGiftPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GiftModel objectWithKeyValues:responseObj],error);
    }];
}
// 符文列表
+ (id)getRuneCompletionHandle:(void (^)(RuneModel *, NSError *))completionHandle
{
    return [self GET:kRunesPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RuneModel objectWithKeyValues:responseObj],error);
    }];
}
// 召唤师技能
+ (id)getSumAbilityCompletionHandle:(void (^)(NSArray *, NSError *))completionHandle
{
    return [self GET:kSumAbilityPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
// 最佳阵容
+ (id)getBestGroupCompletionHandle:(void (^)(NSArray *, NSError *))completionHandle
{
    return [self GET:kBestGroupPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
// 英雄排行
+ (id)getHeroTop10WithHero:(NSString *)hero{
    NSString *str = [NSString stringWithFormat:@"?hero=%@",hero];
    return [kHeroTop10Path stringByAppendingString:str];
}
@end

























