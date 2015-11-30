//
//  ShiPinViewModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinViewModel.h"

@implementation ShiPinViewModel
- (instancetype)initWithSid:(NSString *)sid{
    if (self = [super init]) {
        _sid = sid;
    }
    return self;
}
//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index +=10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [ShiPinNetManager getShiPinWithSid:_sid index:_index completionHandle:^(ShiPinModel *model, NSError *error) {
        if (_index==0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.VAP4BFE3U];
        completionHandle(error);
    }];
}
- (Vap4Bfe3U *)modelForRow:(NSInteger)row{
    if (self.dataArr.count==0) {
        [self showErrorMsg:@"网络无连接"];
        return nil;
    }
    return self.dataArr[row];
}
/*! @brief 每一个视频的背景图片 */
- (NSURL *)imageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].cover];
}
/*! @brief 每一个视频的标题 */
- (NSString *)titleURLForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/*! @brief 每一个视频的简介 */
- (NSString *)detailURLForRow:(NSInteger)row{
    return [self modelForRow:row].kdescription;
}
/*! @brief 每一个视频的连接地址 */
- (NSURL *)vedioURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].mp4_url];
}
/*! @brief 视频长度 */
- (NSString *)lengthURLForRow:(NSInteger)row{
    NSInteger lenth = @([self modelForRow:row].length).integerValue;
    NSInteger minute = lenth/60;
    NSInteger second = lenth%60;
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}
/*! @brief 播放次数 */
- (NSString *)playCountURLForRow:(NSInteger)row{
    double playcount = [self modelForRow:row].playCount;
    if (playcount>10000) {
        return [NSString stringWithFormat:@"%.1lf万",playcount/10000];
    }else{
        return [NSString stringWithFormat:@"%.0lf",playcount];
    }
}
/*! @brief 评论次数 */
- (NSString *)replyCountURLForRow:(NSInteger)row{
    double replyconut = [self modelForRow:row].replyCount;
    if (replyconut>10000) {
        return [NSString stringWithFormat:@"%.1lf万",replyconut/10000];
    }else{
        return [NSString stringWithFormat:@"%.0lf",replyconut];
    }
}
@end
