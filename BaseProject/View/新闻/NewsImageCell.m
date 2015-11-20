//
//  NewsImageCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsImageCell.h"

@implementation NewsImageCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        //左上10
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
        }];
    }
    return _titleLb;
}

- (UILabel *)clicksNumLb {
    if(_clicksNumLb == nil) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contentcell_comment_border"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(12);
        }];
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
        [imageView addSubview:self.clicksNumLb];
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(imageView).insets(UIEdgeInsetsMake(0, 5, 0, 5));
            
        }];
    }
    return _clicksNumLb;
}

- (CDImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[CDImageView alloc] init];
        [self.contentView addSubview:_iconIV0];
        [_iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(97, 74));
        }];
        
    }
    return _iconIV0;
}

- (CDImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[CDImageView alloc] init];
        [self.contentView addSubview:_iconIV1];
        [_iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(97, 74));
        }];
    }
    return _iconIV1;
}

- (CDImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[CDImageView alloc] init];
        [self.contentView addSubview:_iconIV2];
        [_iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(97, 74));
        }];
    }
    return _iconIV2;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
