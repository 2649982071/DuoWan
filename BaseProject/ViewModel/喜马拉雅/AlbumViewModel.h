//
//  AlbumViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface AlbumViewModel : BaseViewModel


@property(nonatomic,assign)NSInteger rowCount;
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,assign)NSInteger pageld;
@property(nonatomic,assign)NSInteger maxPageld;
- (NSString *)nickNameForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)imgPathForRow:(NSInteger)row;
- (NSInteger)playTimesForRow:(NSInteger)row;
- (NSInteger)likeForRow:(NSInteger)row;
- (NSString *)durationForRow:(NSInteger)row;
- (NSInteger)commentsForRow:(NSInteger)row;

@end
