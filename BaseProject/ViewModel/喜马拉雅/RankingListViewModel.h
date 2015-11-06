//
//  RankingListViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface RankingListViewModel : BaseViewModel

@property(nonatomic,assign)NSInteger rowCount;
@property(nonatomic,assign)NSInteger pageld;
// 最大页数
@property(nonatomic,assign)NSInteger maxPageld;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)introForRow:(NSInteger)row;
- (NSURL *)imgForRow:(NSInteger)row;
- (NSInteger)tracksForRow:(NSInteger)row;



@end
