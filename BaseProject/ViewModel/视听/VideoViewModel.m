//
//  VideoViewModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (NSURL *)imageURLForRow:(NSInteger)row{
    NSString *path = [self videoViewModelForRow:row].cover;
    return [NSURL URLWithString:path];
}

- (NSString *)titleURLForRow:(NSInteger)row{
    return [self videoViewModelForRow:row].title;
}

- (NSString *)detailURLForRow:(NSInteger)row{
    return [self videoViewModelForRow:row].desc;
}

- (NSURL *)vedioURLForRow:(NSInteger)row{
    NSString *path = [self videoViewModelForRow:row].mp4Url;
    return [NSURL URLWithString:path];
}

- (NSString *)lengthURLForRow:(NSInteger)row{
    NSInteger lenth = @([self videoViewModelForRow:row].length).integerValue;
    NSInteger minute = lenth/60;
    NSInteger second = lenth%60;
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

- (NSString *)playCountURLForRow:(NSInteger)row{
    double playcount = [self videoViewModelForRow:row].playCount;
    if (playcount>10000) {
        return [NSString stringWithFormat:@"%.1lf万",playcount/10000];
    }else{
        return [NSString stringWithFormat:@"%.0lf",playcount];
    }
}
- (NSString *)replyCountURLForRow:(NSInteger)row{
    double replyconut = [self videoViewModelForRow:row].replyCount;
    if (replyconut>10000) {
        return [NSString stringWithFormat:@"%.1lf万",replyconut/10000];
    }else{
        return [NSString stringWithFormat:@"%.0lf",replyconut];
    }
}
- (NSString *)VidForRow:(NSInteger)row{
    return [self videoViewModelForRow:row].vid;
}
- (VideoVideoListModel *)videoViewModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSURL *)imgURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self videoListViewForRow:row].imgsrc];
}

- (NSString *)headTitleForRow:(NSInteger)row{
    return [self videoListViewForRow:row].title;
}
- (VideoVideoSidListModel *)videoListViewForRow:(NSInteger)row{
    return self.dataArr1[row];
}
- (NSMutableArray *)dataArr1{
    if (!_dataArr1) {
        _dataArr1 = [NSMutableArray new];
    }
    return _dataArr1;
}

/*! @brief 获取更多数据 */
- (void)getMoreDataCompletionHandle:(void(^)(NSError *error))completion{
    _index += 10;
    [self getDataFromNetCompleteHandle:completion];
}
/*! @brief 刷新数据 */
- (void)refreshDataCompletionHandle:(void(^)(NSError *error))completion{
    _index = 0;
    [self getDataFromNetCompleteHandle:completion];
}
/*! @brief 获取数据 */
- (void)getDataFromNetCompleteHandle:(void(^)(NSError *error))completion{
    [VideoNetManager getVideoWithIndex:_index completionHandle:^(VideoModel *model, NSError *error) {
        if (_index==0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videoList];
        [self.dataArr1 addObjectsFromArray:model.videoSidList];
        completion(error);
    }];
}


@end
