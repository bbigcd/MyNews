//
//  VideoViewModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"
@interface VideoViewModel : BaseViewModel
@property (nonatomic)NSInteger rowNumber;
@property (nonatomic)NSInteger index;
/*! @brief 每一个视频的背景图片 */
- (NSURL *)imageURLForRow:(NSInteger)row;
/*! @brief 每一个视频的标题 */
- (NSString *)titleURLForRow:(NSInteger)row;
/*! @brief 每一个视频的简介 */
- (NSString *)detailURLForRow:(NSInteger)row;
/*! @brief 每一个视频的连接地址 */
- (NSURL *)vedioURLForRow:(NSInteger)row;
/*! @brief 视频长度 */
- (NSNumber *)lengthURLForRow:(NSInteger)row;
/*! @brief 播放次数 */
- (NSNumber *)playCountURLForRow:(NSInteger)row;
/*! @brief 评论次数 */
- (NSNumber *)replyCountURLForRow:(NSInteger)row;
/*! @brief 各详情页 */
- (NSString *)VidForRow:(NSInteger)row;
/*! 表头图片地址 */
- (NSURL *)imgURLForRow:(NSInteger)row;
@property (nonatomic, strong)NSMutableArray * dataArr1;
@end
