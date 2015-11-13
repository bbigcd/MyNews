//
//  ShiPinViewModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ShiPinNetManager.h"
@interface ShiPinViewModel : BaseViewModel
/*! 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithSid:(NSString *)sid;

/*! 初始化类型 */
@property (nonatomic, strong)NSString * sid;
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
- (NSString *)lengthURLForRow:(NSInteger)row;
/*! @brief 播放次数 */
- (NSString *)playCountURLForRow:(NSInteger)row;
/*! @brief 评论次数 */
- (NSString *)replyCountURLForRow:(NSInteger)row;
@end
