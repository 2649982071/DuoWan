//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"


@implementation TuWanImageCell
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize: 17];
        
    }
    return _titleLabel;
}
- (UILabel *)clicksLabel
{
    if (!_clicksLabel) {
        _clicksLabel = [[UILabel alloc]init];
        _clicksLabel.font = [UIFont systemFontOfSize:12];
        _clicksLabel.textAlignment = NSTextAlignmentRight;
    }
    return _clicksLabel;
}
- (TRImageView *)iconIV0
{
    if (!_iconIV0) {
        _iconIV0 = [[TRImageView alloc]init];
      //  _iconIV0.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV0;
}
- (TRImageView *)iconIV1
{
    if (!_iconIV1) {
        _iconIV1 = [[TRImageView alloc]init];
       // _iconIV1.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV1;
}
- (TRImageView *)iconIV2
{
    if (!_iconIV2) {
        _iconIV2 = [[TRImageView alloc]init];
      //  _iconIV2.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.clicksLabel];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
/**       标题 上 ：10  左 ：10 */
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
        }];
/**  点击人数   上 ： 与标题对齐    右 ：10    宽度 最大70 最小 40*/
        [self.clicksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.titleLabel.mas_topMargin);
            make.left.mas_equalTo(self.titleLabel.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(70);
            make.width.mas_greaterThanOrEqualTo(40);
        }];
/**  图片 宽高相等，间距为5   高度 88  上    左   大小 ： */
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.width.mas_equalTo((kWindowW - 30)/3);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(5);
        }];
/**  上 与 图片1对齐 大小一样 */
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV0);
            make.left.mas_equalTo(self.iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.iconIV0);
        }];
/**    上 与 图片1对齐 大小一样 */
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV0);
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV0);
        }];
    }
    return  self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
