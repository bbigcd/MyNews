//
//  NewsListCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell
- (CDImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [CDImageView new];
        //内容模式：保持比例，填充满
        //        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:14];
    }
    return _titleLb;
}

- (UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb = [UILabel new];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        //自动换行
        _longTitleLb.numberOfLines = 0;
    }
    return _longTitleLb;
}

- (UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [UILabel new];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
    }
    return _clicksNumLb;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        //布局
        //图片 左10 宽高80、60，竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 60));
            make.centerY.mas_equalTo(0);
        }];
        //题目 距离图片右边缘8，右边缘10，上边缘比图片上边缘矮3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            //Margin 边缘
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
        //长题目 左右边缘与题目一样 上边缘 距离题目下边 8像素
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
        }];
        //点击数 下边缘与图片对齐，右边缘与任意title对齐
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
        }];
    }
    return self;
}
@end
