//
//  NewsReplyCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyCell.h"

@implementation NewsReplyCell

- (CDImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[CDImageView alloc] init];
        _headIV.layer.cornerRadius = 20;
        [self.contentView addSubview:_headIV];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(9);
            make.top.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }
    return _headIV;
}

- (UILabel *)sayLabel {
    if(_sayLabel == nil) {
        _sayLabel = [[UILabel alloc] init];
        _sayLabel.textColor = [UIColor blackColor];
        _sayLabel.font = [UIFont systemFontOfSize:15];
        _sayLabel.numberOfLines = 0;//自动换行
        [self.contentView addSubview:_sayLabel];
        [_sayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_addressLabel.mas_bottom).mas_equalTo(15);
            make.left.mas_equalTo(_headIV.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-24);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _sayLabel;
}

- (UILabel *)nameLabel {
    if(_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithRed:81/255.0 green:134/255.0 blue:203/255.0 alpha:1.0];
        _nameLabel.font = [UIFont systemFontOfSize:16];
//        _nameLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headIV.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(18);
            make.right.mas_equalTo(-80);
        }];
    }
    return _nameLabel;
}

- (UILabel *)addressLabel {
    if(_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = [UIColor lightGrayColor];
        _addressLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:_addressLabel];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headIV.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(_nameLabel.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-8);
        }];
    }
    return _addressLabel;
}

- (UILabel *)supposeLabel {
    if(_supposeLabel == nil) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"night_contentview_pkbutton"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(16);
            make.right.mas_equalTo(-8);
            make.size.mas_equalTo(CGSizeMake(17, 16));
        }];
        _supposeLabel = [[UILabel alloc] init];
        _supposeLabel.textColor = [UIColor lightGrayColor];
        _supposeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_supposeLabel];
        [_supposeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(imageView.mas_left).mas_equalTo(-5);
        }];
    }
    return _supposeLabel;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
