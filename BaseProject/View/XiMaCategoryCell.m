//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by ios－07 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell

- (UILabel *)orderLabel
{
    if (!_orderLabel) {
        _orderLabel = [UILabel new];
        _orderLabel.font = [UIFont boldFlatFontOfSize:17];
        _orderLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_orderLabel];
    }
    return _orderLabel;
}
- (TRImageView *)iconIV
{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
    }
    return _iconIV;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldFlatFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.font = [UIFont systemFontOfSize:15];
        _descLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLabel];
    }
    return _descLabel;
}

- (UILabel *)numberlabel
{
    if (!_numberlabel) {
        _numberlabel = [[UILabel alloc]init];
        _numberlabel.font = [UIFont systemFontOfSize:12];
        _numberlabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberlabel];
    }
    return _numberlabel;
}
- (TRImageView *)numberIV
{
    if (!_numberIV) {
        _numberIV = [[TRImageView alloc]init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
    }
    return _numberIV;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//       右箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//       添加依赖 autoLayout 一定要有顺序，即从左到右，从上到下
        [self.orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(20);
        }];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLabel.mas_right).mas_equalTo(0);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
        }];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          //  make.top.mas_equalTo(self.titleLabel.mas_top).mas_equalTo(5);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
        }];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
         //   make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
        }];
        [self.numberlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
            make.right.mas_equalTo(-10);
        }];
//      分割线 左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    }
    

    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
