//
//  NewsViewModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewModel.h"

@implementation NewsViewModel
- (instancetype)initWithType:(InfoType)type{
    if (self = [super init]) {
        _type = type;
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

- (HeadLineT1348647853363Model *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleForRowInHeadLine:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)iconURLForRowInHeadLine:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
- (NSString *)digestForRowInHeadLine:(NSInteger)row{
    return [self modelForRow:row].digest;
}
- (NSString *)replyCountForRowInHeadLine:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld跟帖",[self modelForRow:row].replyCount];
}
- (NSMutableArray *)YuLeArr{
    if (!_YuLeArr) {
        _YuLeArr = [NSMutableArray new];
    }
    return _YuLeArr;
}

/** 更新数据 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [NewsNetManager getNewsInfoWithType:_type index:_start completionHandle:^(HeadLineModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.T1348647853363];
        completionHandle(error);
    }];
}
@end
