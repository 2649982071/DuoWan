//
//  AlbumViewModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AlbumViewModel.h"

@implementation AlbumViewModel


- (NSInteger)rowCount
{
    return self.dataArr.count;
}

- (AlbumTracksListModel *)tracksListForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)nickNameForRow:(NSInteger)row{
    return [self tracksListForRow:row].nickname;
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self tracksListForRow:row].title;
}
- (NSURL *)imgPathForRow:(NSInteger)row{
    return [NSURL URLWithString:[self tracksListForRow:row].albumImage];
}
- (NSInteger)playTimesForRow:(NSInteger)row{
    return [self tracksListForRow:row].playtimes;
}
- (NSInteger)likeForRow:(NSInteger)row{
    return [self tracksListForRow:row].likes;
}
- (NSString *)durationForRow:(NSInteger)row{
    NSInteger time = (NSInteger)[self tracksListForRow:row].duration;
    
    NSString *duration = [NSString stringWithFormat:@"%02ld:%ld",time/60,time%60];
    return duration;
}
- (NSInteger)commentsForRow:(NSInteger)row{
    return [self tracksListForRow:row].comments;
}



- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageld = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
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
    [XiMaNetManager getAlbumWithId:_ID page:_pageld completionHandle:^(id model, NSError *error) {
        if (_pageld == 1) {
            [self.dataArr removeAllObjects];
        }
        AlbumModel *obj = (AlbumModel *)model;
        _maxPageld = obj.tracks.maxPageId;
        [self.dataArr addObjectsFromArray:obj.tracks.list];
    }];
}
@end
