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
- (NSString *)tracksForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集",[self rankingListForRow:row].tracks ];
}

/**  当前数据对应的数据ID */
- (NSInteger)albumIDForRow:(NSInteger)row
{
    return [self rankingListForRow:row].albumId;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId ++;
    if (_pageId > _maxPageId) {
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"已经到底了"}];
        
        completionHandle(error);
        return;
    }
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [XiMaNetManager getRankListWithPageId:_pageId completionHandle:^(id model, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            RankingListModel *obj = (RankingListModel *)model;
            _maxPageId = obj.maxPageId;
            [self.dataArr addObjectsFromArray:obj.list];
        }
        
        completionHandle(error);
    }];
    
}

@end
