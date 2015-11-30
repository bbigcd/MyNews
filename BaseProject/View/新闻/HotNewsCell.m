//
//  NewsListCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotNewsCell.h"

@implementation HotNewsCell
- (CDImageView *)hotIV {
    if(_hotIV == nil) {
        _hotIV = [[CDImageView alloc] init];
        [self.contentView addSubview:self.hotIV];
        [self.hotIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.bottom.mas_equalTo(self.iconIV.mas_top).mas_equalTo(-2);
        }];
        UILabel *label = [UILabel new];
        label.text = @"大家都在看";
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor redColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hotIV.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.hotIV);
        }];
    }
    return _hotIV;
}
- (CDImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [CDImageView new];
        [self.contentView addSubview:self.iconIV];
        //布局
        //图片 左10 宽高80、60，竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 60));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLb];
        //题目 距离图片右边缘8，右边缘10，上边缘比图片上边缘矮3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            //Margin 边缘
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(1);
        }];
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
        [self.contentView addSubview:self.longTitleLb];
        //长题目 左右边缘与题目一样 上边缘 距离题目下边 8像素
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.bottom.mas_equalTo(_iconIV.mas_bottom);
        }];
    }
    return _longTitleLb;
}

- (UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contentcell_comment_border"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.right.mas_equalTo(-5);
        }];
        _clicksNumLb = [UILabel new];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        [imageView addSubview:self.clicksNumLb];
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(imageView).insets(UIEdgeInsetsMake(0, 3, 0, 3));
            
        }];
    }
    return _clicksNumLb;
}

@end
