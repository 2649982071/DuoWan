//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel

- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
/**   防御性编程 ，不允许使用init初始化*/
/**  %s __func__   会显示 那个类中的哪个方法*/
- (instancetype)init
{
    if (self = [super init]) {
        NSAssert(NO, @"%s 必须使用initWithAid：初始化",__func__);
    }
    return self;
}
- (NSInteger)rowNumber
{
    return self.imageModel.content.count;
}
- (NSURL *)picURLForRow:(NSInteger)row
{
    TuWanImageContentModel *model = self.imageModel.content[row];
    return [NSURL URLWithString:model.pic];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanNetManager getPicDetailWithId:_aid completionHandle:^(TuWanImageModel *model, NSError *error) {
 
        self.imageModel = model;
        completionHandle(error);
    }];
}

@end
