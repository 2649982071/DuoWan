//
//  TuWanImageModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
//  TuWanImageEsArrayModel,
@class TuWanImageInfoChildModel,TuWanimageShowItemModel,TuWanImageInfoModel,TuWanImageRelevantModel,TuWanImageContentModel,TuWanImageContentInfomodel;
//@interface TuWanImageModel : BaseModel
//
//@property (nonatomic, strong) NSArray<TuWanImageEsArrayModel *> *esArray;
//
//@end
@interface TuWanImageModel : BaseModel

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;

@property (nonatomic, copy) NSString *typename;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuWanImageInfoChildModel *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuWanimageShowItemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, assign) NSInteger zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<TuWanImageRelevantModel *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<TuWanImageContentModel *> *content;

@property (nonatomic, copy) NSString *desc;

@end

@interface TuWanImageInfoChildModel : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuWanimageShowItemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanImageInfoModel *info;

@end

@interface TuWanImageInfoModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

@interface TuWanImageRelevantModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *typename;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@end

@interface TuWanImageContentModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) TuWanImageInfoModel *info;

@end



