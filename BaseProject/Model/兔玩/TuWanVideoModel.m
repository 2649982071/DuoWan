//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"TuWanVideoesArraymodel" : [TuWanVideoEsArrayModel class]};
}
@end

@implementation TuWanVideoEsArrayModel

+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanVideoContentModel class], @"relevant" : [TuWanVideoRelevantModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}
@end

@implementation TuWanVideoContentModel

@end

@implementation TuWanVideoRelevantModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}
@end


