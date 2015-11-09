//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"


@interface TuWanPicViewModel : BaseViewModel

- (instancetype)initWithAid:(NSString *)aid;

@property(nonatomic,assign)NSInteger rowNumber;
//@property(nonatomic,strong)NSArray *imageURLs;
/**  aid 属性应该非空 可以使用 xcode7 的非空标识*/
@property(nonatomic,strong)NSString *aid;
/**  请求下来的 model */
@property(nonatomic,strong)TuWanImageModel *imageModel;
- (NSURL *)picURLForRow:(NSInteger)row;
@end
