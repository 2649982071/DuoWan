//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanImageCell : UITableViewCell

/**  题目*/
@property(nonatomic,strong)UILabel *titleLabel;
/** 点击数*/
@property(nonatomic,strong)UILabel *clicksLabel;
/**  图片1*/
@property(nonatomic,strong)TRImageView *iconIV0;
/**  图片2*/
@property(nonatomic,strong)TRImageView *iconIV1;
/**  图片3*/
@property(nonatomic,strong)TRImageView *iconIV2;
@end
