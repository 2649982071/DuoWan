//
//  TuWanListCell.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
- (TRImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[TRImageView alloc]init];
//       图片模式 ：保持比例，填充满
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}
- (UILabel *)longTitleLabel
{
    if (!_longTitleLabel) {
        _longTitleLabel = [[UILabel alloc]init];
        _longTitleLabel.font = [UIFont systemFontOfSize:14];
        _longTitleLabel.textColor = [UIColor lightGrayColor];
        _longTitleLabel.numberOfLines = 0;
    }
    return _longTitleLabel;
}
- (UILabel *)clicksLabel
{
    if (!_clicksLabel) {
        _clicksLabel = [[UILabel alloc]init];
        _clicksLabel.font = [UIFont systemFontOfSize:12];
        _clicksLabel.textColor = [UIColor lightGrayColor];
        _clicksLabel.textAlignment = NSTextAlignmentRight ;
    }
    return _clicksLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.longTitleLabel];
        [self.contentView addSubview:self.clicksLabel];
//      图片  左 10 宽 92，70 竖向居中
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
//    标题 左：距离图片 8  右： 10  上：与图片上边缘 3
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgView.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(self.imgView.mas_topMargin).mas_equalTo(3);
            make.right.mas_equalTo(-10);
        }];
//    长标题 与标题 左 右 对齐  上： 距上标题 8
        [self.longTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLabel.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLabel.mas_right);
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(8);
        }];
//     浏览人数  下边缘与图片对齐 右边缘与标题对齐
        [self.clicksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_imgView.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLabel.mas_rightMargin);
        }];
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
