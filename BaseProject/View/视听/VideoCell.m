//
//  VideoCell.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@implementation VideoCell


- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(20);
        }];
    }
    return _title;
}

- (UILabel *)detail {
    if(_detail == nil) {
        _detail = [[UILabel alloc] init];
        _detail.font = [UIFont systemFontOfSize:16];
        _detail.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_detail];
        [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(_title.mas_bottom).mas_equalTo(10);
        }];
    }
    return _detail;
}

- (UIButton *)videoBG {
    if(_videoBG == nil) {
        _videoBG = [[UIButton alloc] init];
        [self.contentView addSubview:_videoBG];
        [_videoBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(_detail.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(170);
        }];
        
        _imageViewbg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_list_cell_big_icon"]];
        [_videoBG addSubview:_imageViewbg];
        [_imageViewbg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.center.mas_equalTo(0);
        }];
        
        [_videoBG bk_addEventHandler:^(id sender) {
            [_imageViewbg setHidden:YES];
            AVPlayer *player=[AVPlayer playerWithURL:self.videoURL];
            [player play];
            [VideoCell sharedInstance].player = player;
            [sender addSubview:[VideoCell sharedInstance].view];
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _videoBG;
}

- (UILabel *)time {
    if(_time == nil) {
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:14];
        _time.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_list_cell_time"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 16));
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-12);
        }];
        [self.contentView addSubview:_time];
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
        }];
    }
    return _time;
}

- (UILabel *)playCount {
    if(_playCount == nil) {
        _playCount = [[UILabel alloc] init];
        _playCount.font = [UIFont systemFontOfSize:14];
        _playCount.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_list_cell_icon"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(16, 16));
            make.centerY.mas_equalTo(_time);
            make.left.mas_equalTo(_time.mas_right).mas_equalTo(20);
        }];
        [self.contentView addSubview:_playCount];
        [_playCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(2);
        }];
        
    }
    return _playCount;
}

- (UIButton *)shareBtn {
    if(_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_shareBtn];
        [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.mas_equalTo(_time);
            make.right.mas_equalTo(-10);
        }];
    }
    return _shareBtn;
}

- (UILabel *)replyCount {
    if(_replyCount == nil) {
        _replyCount = [[UILabel alloc] init];
        _replyCount.font = [UIFont systemFontOfSize:14];
        _replyCount.textColor = [UIColor lightGrayColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_category_comment"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_shareBtn.mas_left).mas_equalTo(-10);
            make.height.mas_equalTo(33);
            make.centerY.mas_equalTo(_time);
        }];
        [imageView addSubview:_replyCount];
        [_replyCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-30-_replyCount.bounds.size.width);
            make.centerY.mas_equalTo(imageView);
        }];
    }
    return _replyCount;
}

//配置视频播放的相关配置
//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除-->自己想办法
    if ([VideoCell sharedInstance].view.superview == self.videoBG) {
        [[VideoCell sharedInstance].view removeFromSuperview];
        [VideoCell sharedInstance].player = nil;
        [_imageViewbg setHidden:NO];
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
