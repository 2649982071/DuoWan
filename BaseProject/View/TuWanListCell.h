//
//  TuWanListCell.h
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface TuWanListCell : UITableViewCell
/**  左侧图片 */
@property(nonatomic,strong)TRImageView *imgView;

/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLabel;
/**  常题目标签*/
@property(nonatomic,strong)UILabel *longTitleLabel;
/**  浏览标签 */
@property(nonatomic,strong)UILabel *clicksLabel;
@end
