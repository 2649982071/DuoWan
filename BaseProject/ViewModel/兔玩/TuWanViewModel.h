//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
- (instancetype)initWithType:(InfoType)type;

@property(nonatomic,assign)InfoType type;
@property(nonatomic,assign)NSInteger rowCount;
// 存放头部滚动栏
@property(nonatomic,strong)NSArray *picArr;
//是否有头部滚动栏
@property(nonatomic,getter=isExistIndexPic)BOOL existIndexPic;
// 当前页数索引值
@property(nonatomic,assign)NSInteger start;
/**   判断某一行对应的数据是否有图 */
- (BOOL)containImages:(NSInteger)row;




// 返回某行的数据
- (NSString *)titleForRow:(NSInteger)row;

- (NSString *)clickForRow:(NSInteger)row;

- (NSURL *)imgPathForRow:(NSInteger)row;
- (NSString *)descriptionForRow:(NSInteger)row;
// 通过行数 返回列表中某行数据的图片组
- (NSArray *)iconURLSForRowInList:(NSInteger)row;


// 获取列表中某航数据对应的html5 链接
- (NSURL *)detailURLForRowInList:(NSInteger)row;
// 获取展示栏中某航数据对应的html5 链接
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

- (NSURL *)iconForRowInIndexPic:(NSInteger)row;
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
@property(nonatomic,assign)NSInteger indexPicNumber;
//    头部图片
//- (NSURL *)titleImgPathForRow:(NSInteger)row;


/**  当前数据类型是视频*/
- (BOOL)isVideoInListForRow:(NSInteger)row;
- (BOOL)isVideoInIndexPicFowRow:(NSInteger)row;
/**  当前数据类型是图片*/
- (BOOL)isPicInListForRow:(NSInteger)row;
- (BOOL)isPicInIndexPicForRow:(NSInteger)row;
/** 当前数据类型是html*/
- (BOOL)isHtmlInListForRow:(NSInteger)row;
- (BOOL)isHtmlInIndexPicForRow:(NSInteger)row;
@end
