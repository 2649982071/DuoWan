//
//  TRImageView.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView

- (instancetype)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
//      按比例放大充满
        _imageView.contentMode = 2;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        /** 当前视图容易减掉超出自身区域的视图 */
        self.clipsToBounds = YES;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
