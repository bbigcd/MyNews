//
//  FirstYaoWenCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FirstYaoWenCell.h"

@implementation FirstYaoWenCell

- (CDImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [CDImageView new];
        [self.contentView addSubview:self.iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-76);
        }];
        
        
    }
    return _iconIV;
}
- (UILabel *)numberLb {
    if(_numberLb == nil) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"todaynews_cell_tag"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        _numberLb = [[UILabel alloc] init];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor whiteColor];
        [imageView addSubview:_numberLb];
        [_numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(3);
        }];
    }
    return _numberLb;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(195);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
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
        
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(218);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
    }
    return _longTitleLb;
}

- (UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contentcell_comment_border"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
