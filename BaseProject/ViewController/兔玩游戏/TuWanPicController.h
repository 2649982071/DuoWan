//
//  TuWanPicController.h
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanPicController : UIViewController

/**  此界面内容要根据aid 决定*/
- (instancetype _Nonnull)initWithAid:(NSString * _Nonnull)aid;

@property(nonatomic,strong)NSString * _Nonnull aid;
@end
