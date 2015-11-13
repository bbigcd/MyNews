//
//  VideoCell.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell

/*! 题目标签 */
@property (nonatomic, strong)UILabel * title;

/*! 长题目标签 */
@property (nonatomic, strong)UILabel * detail;

/*! 视频背景图 */
@property (nonatomic, strong)UIButton * videoBG;

/*! 视频里面的图 */
@property (nonatomic, strong)UIImageView * imageViewbg;

/*! 视频播放地址 */
@property (nonatomic, strong)NSURL * videoURL;

/*! 时长 */
@property (nonatomic, strong)UILabel * time;

/*! 播放次数 */
@property (nonatomic, strong)UILabel * playCount;

/*! 评论次数 */
@property (nonatomic, strong)UILabel * replyCount;

/*! 分享按钮 */
@property (nonatomic, strong)UIButton * shareBtn;


@end