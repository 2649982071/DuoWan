//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
- (instancetype)initWithType:(InfoType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
//  预防性编程，防止没有使用initwithType初始化
- (instancetype)init
{
    if (self = [super init]) {
//      用户如果使用此方法初始化，则崩溃
        NSAssert1(NO, @"%s 必须使用initWithType初始化",__func__);
    }
    return self;
}
- (NSInteger)rowCount
{
    return self.dataArr.count;
}
- (BOOL)isExistIndexPic
{
    return self.picArr != nil && self.picArr.count != 0;
}

/**   判断某一行对应的数据是否有图 */
/**  根据showType  0是没图， 1是有图 */
- (BOOL)containImages:(NSInteger)row
{
    return [[self dataForRow:row].showtype isEqualToString:@"1"];
}
- (TuWanDataIndexpicModel *)dataForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self dataForRow:row].title;
}

- (NSString *)clickForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%@人评论",[self  dataForRow:row].click];
}

- (NSURL *)imgPathForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataForRow:row].litpic];
}
- (NSString *)descriptionForRow:(NSInteger)row{
    return [self dataForRow:row].desc;
}
- (TuWanDataIndexpicModel *)indexPicForRow:(NSInteger)row
{
    return self.picArr[row];
}
// 通过行数 返回列表中某行数据的图片组
- (NSArray *)iconURLSForRowInList:(NSInteger)row
{
    NSMutableArray *arr = [NSMutableArray new];
    NSArray *array = [self dataForRow:row].showitem;
    for (int i = 0; i < array.count; i ++) {
        TuWanDataIndexpicShowitemModel *model = array[i];
        [arr addObject:[NSURL URLWithString:model.pic]];
    }
    
    return [arr copy];
}
/** 头部滚动栏的图片*/
- (NSURL *)iconForRowInIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self indexPicForRow:row].litpic];
}
/** 头部滚动栏的描述*/
- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self indexPicForRow:row].title;
}
/** 头部滚动栏的数量*/
- (NSInteger)indexPicNumber
{
    return self.picArr.count;
}
// 获取列表中某航数据对应的html5 链接
- (NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self dataForRow:row].html5];
}
// 获取展示栏中某航数据对应的html5 链接
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self indexPicForRow:row].html5];
}
// 下拉刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
// 上啦，获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
// 获取数据模型
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
  self.dataTask = [TuWanNetManager getTuWanInfoWithType:_type start:_start completionHandle:^(TuWanModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
            self.picArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
      
        self.picArr = model.data.indexpic;
      completionHandle(error);
    }];
}
@end
