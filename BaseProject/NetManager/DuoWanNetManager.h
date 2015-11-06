//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"

@interface DuoWanNetManager : BaseNetManager
// 周免
+ (id)getFreeHeroForCompletionHandle:(void(^)(FreeHeroModel *model,NSError *error))completionHandle;
// 全部英雄
+ (id)getAllHeroForCompletionHandle:(void(^)(AllHeroModel *model,NSError *error))completionHandle;
// 获取英雄皮肤
+ (id)getHeroSkinForHero:(NSString *)hero kCompletionHandle;

// 英雄视频
+ (id)getHeroViedoWithPage:(NSInteger)page tag:(NSString *)tag kCompletionHandle;
//  获取英雄配音
+ (id)getHeroSoundForHero:(NSString *)hero kCompletionHandle;

// 英雄出装
+(id)getHeroCZForHero:(NSString *)hero kCompletionHandle;

//英雄资料
+ (id)getHeroDetailForHeroName:(NSString *)heroName kCompletionHandle;

// 天赋符文
+ (id)getHeroGiftForHero:(NSString *)hero kCompletionHandle;

// 英雄改动
+ (id)getHeroChangeForHero:(NSString *)hero completionHandle:(void(^)(HeroChangeModel *model,NSError *error))completionHandle;

// 一周数据
+ (id)getHeroWeekDataWithHeroId:(NSInteger)heroId   completionHandle:(void(^)(HeroWeekDataModel *model,NSError *error))completionHandle;

// 游戏百科列表
+ (id)getToolMenuCompletionHandle:(void(^)(NSArray *menu,NSError *error))completionHandle;

//  装备分类
+ (id)getZBCategoryCompletionHandle:(void(^)(NSArray *model,NSError *error))completionHandle;
// 某分类装备列表
+ (id)getZBItemForTag:(NSString *)tag kCompletionHandle;
// 装备详情
+ (id)getZBItemDetailForID:(NSInteger)ID kCompletionHandle;

// 天赋
+ (id)getGiftCompletionHandle:(void(^)(GiftModel *model,NSError *error))completionHandle;

// 符文列表
+ (id)getRuneCompletionHandle:(void(^)(RuneModel *model,NSError *error))completionHandle;
// 召唤师技能
+ (id)getSumAbilityCompletionHandle:(void(^)(NSArray *model,NSError *error))completionHandle;
// 最佳阵容
+ (id)getBestGroupCompletionHandle:(void(^)(NSArray *model,NSError *error))completionHandle;
// 个性关键词查询

// LOL小说

// 英雄头像

// 英雄技能图标

// 英雄排行
+ (id)getHeroTop10WithHero:(NSString *)hero;
//评论

//查战绩

@end













