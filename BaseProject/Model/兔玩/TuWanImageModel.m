//
//  TuWanImageModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageModel.h"

//@implementation TuWanImageModel
//
//
//+ (NSDictionary *)objectClassInArray{
//    return @{@"esArray" : [TuWanImageEsArrayModel class]};
//}
//@end
@implementation TuWanImageModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanimageShowItemModel class], @"relevant" : [TuWanImageRelevantModel class], @"content" : [TuWanImageContentModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}
@end


@implementation TuWanImageInfoChildModel

@end


@implementation TuWanimageShowItemModel

@end


@implementation TuWanImageInfoModel

@end


@implementation TuWanImageRelevantModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}
@end


@implementation TuWanImageContentModel

@end





