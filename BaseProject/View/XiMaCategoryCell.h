//
//  XiMaCategoryCell.h
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

/**  懒加载插件   DZLazyInstantiate*/

@interface XiMaCategoryCell : UITableViewCell
/**  序列号标签*/
@property(nonatomic,strong)UILabel *orderLabel;
/**  类型图片*/
@property(nonatomic,strong)TRImageView *iconIV;
/** 类型描述*/
@property(nonatomic,strong)UILabel *titleLabel;
/**  集数 */
@property(nonatomic,strong)UILabel *numberlabel;
/**  图标*/
@property(nonatomic,strong)TRImageView *numberIV;
/**  类型名称*/
@property(nonatomic,strong)UILabel *descLabel;
@end
