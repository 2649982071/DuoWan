//
//  RankingListViewModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankingListViewModel.h"

@implementation RankingListViewModel

- (NSInteger)rowCount
{
    return self.dataArr.count;
}

- (RankListListModel *)rankingListForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self rankingListForRow:row].title;
}
- (NSString *)introForRow:(NSInteger)row{
    return [self rankingListForRow:row].intro;
}
- (NSURL *)imgForRow:(NSInteger)row{
    return [NSURL URLWithString:[self rankingListForRow:row].albumCoverUrl290];
}
- (NSInteger)tracksForRow:(NSInteger)row{
    return [self rankingListForRow:row].tracks ;
}


- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageld = 1;
    [self getMoreDataCompletionHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageld ++;
    if (_pageld > _maxPageld) {
        return;
    }
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [XiMaNetManager getRankListWithPageId:_pageld completionHandle:^(id model, NSError *error) {
        if (_pageld == 1) {
            [self.dataArr removeAllObjects];
        }
        RankingListModel *obj = (RankingListModel *)model;
        _maxPageld = obj.maxPageId;
        [self.dataArr addObjectsFromArray:obj.list];
    }];
    
}

@end
