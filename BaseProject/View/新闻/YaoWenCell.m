//
//  YaoWenCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenCell.h"

@implementation YaoWenCell
- (CDImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [CDImageView new];
        [self.contentView addSubview:self.iconIV];
        //布局
        //图片 左10 宽高97、73，竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(97, 73));
            make.centerY.mas_equalTo(0);
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
        //使用KVO-键值观察，如果text被赋值为1，颜色是
        //下方方法;如果——numberLb的text属性被赋新值，则触发task
        //这里不知道怎么解决约束加多问题    ****************************
        [_numberLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(10);
                    make.left.mas_equalTo(10);
                    make.right.mas_equalTo(-10);
                    make.bottom.mas_equalTo(-76);
                }];
                [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(200);
                    make.left.mas_equalTo(10);
                    make.right.mas_equalTo(-10);
                }];
                [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(218);
                    make.left.mas_equalTo(10);
                    make.right.mas_equalTo(-10);
                }];
                UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contentcell_comment_border"]];
                [self.contentView addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.mas_equalTo(-10);
                    make.right.mas_equalTo(-5);
                }];
                [imageView addSubview:self.clicksNumLb];
                [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(imageView).insets(UIEdgeInsetsMake(0, 3, 0, 3));
                    
                }];
            }else{
                return;
            }
        }];
    }
    return _numberLb;
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
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
