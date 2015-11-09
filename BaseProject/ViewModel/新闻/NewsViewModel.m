//
//  NewsViewModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewModel.h"
//获取数据的宏定义
#define   kNewsNetManager(Type,Array)   [NewsNetManager getNewsInfoWithType:_type index:_start completionHandle:^(Type *model, NSError *error) {\
[self.dataArr addObjectsFromArray:model.Array];\
completionHandle(error);\
}]
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
    switch (_type) {
        case InfoTypeHeadLine: {
            _start = 140;
            break;
        }
        case InfoTypeYuLe: {
            _start = 20;
            break;
        }
        case InfoTypeHot: {
            _start = 0;//无效
            break;
        }
        case InfoTypeSports: {
            _start = 20;
            break;
        }
        case InfoTypeScience: {
            _start = 20;
            break;
        }
        case InfoTypeEconomics: {
            _start = 20;
            break;
        }
        default: {
            break;
        }
    }
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    //根据type的索引来取不同的
    switch (_type) {
        case InfoTypeHeadLine: {
            self.dataTask = kNewsNetManager(HeadLineModel, T1348647853363);
            break;
        }
        case InfoTypeYuLe: {
            self.dataTask = kNewsNetManager(YuLeModel, T1348648517839);
            break;
        }
        case InfoTypeHot: {
            self.dataTask = kNewsNetManager(HotModel, tuiJian);
            break;
        }
        case InfoTypeSports: {
            self.dataTask = kNewsNetManager(SportsModel, T1348649079062);
            break;
        }
        case InfoTypeScience: {
            self.dataTask = kNewsNetManager(ScienceModel, T1348649580692);
            break;
        }
        case InfoTypeEconomics: {
            self.dataTask = kNewsNetManager(EconomicsModel, T1348648756099);
            break;
        }
        default: {
            break;
        }
    }
}
@end
