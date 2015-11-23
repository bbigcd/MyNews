//
//  NewsViewModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewModel.h"
@interface NewsViewModel ()
//@property (nonatomic)NSInteger count;
@end
//获取数据的宏定义
#define   kNewsNetManager(Start,Index,Type,Array)   [NewsNetManager getNewsInfoWithType:_type start:_start index:_index completionHandle:^(Type *model, NSError *error) {\
if (_start == Start &&_index == Index) {\
    [self.dataArr removeAllObjects];\
    self.adsArr = nil;\
}\
[self.dataArr addObjectsFromArray:model.Array];\
self.adsArr = [self modelForArr:self.dataArr row:0].ads;\
completionHandle(error);\
}];
@implementation NewsViewModel
static NSInteger count = 0;
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
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (BOOL)isHashead{
    return self.adsArr != nil && self.adsArr.count != 0;
}
- (BOOL)containImages:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].imgextra != nil && [self modelForArr:self.dataArr row:row].imgextra.count != 0;
}
- (NewsAllDataModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}
- (NewsAllDataImgModel *)modelInImgForRow:(NSInteger)row{
    return self.adsArr[row];
}
- (NSInteger)indexPicNumber{
    return self.adsArr.count;
}
- (BOOL)isPicForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].skipType != nil && [[self modelForArr:self.dataArr row:row].skipType isEqualToString:@"photoset"];
}
- (BOOL)isPicForRowInHead:(NSInteger)row{
    return [[self modelInImgForRow:row].tag isEqualToString:@"photoset"];
}

- (BOOL)isHtmlForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].imgextra == nil && [self modelForArr:self.dataArr row:row].TAG == nil;
}
- (BOOL)isHtmlForRowInHead:(NSInteger)row{
    return [[self modelInImgForRow:row].tag isEqualToString:@"article"];//假的
    return YES;
}
- (BOOL)isVideoForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].TAG != nil && [[self modelForArr:self.dataArr row:row].TAG isEqualToString:@"视频"];
}
- (BOOL)isVideoForRowInHead:(NSInteger)row{
    return [[self modelInImgForRow:row].tag isEqualToString:@"video"];//假的
    return YES;
}
- (NSString *)detailURLForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].docid;
}
- (NSArray *)iconURLSForRow:(NSInteger)row{
    NSArray *arr = [self modelForArr:self.dataArr row:row].imgextra;
    NSMutableArray *Arr = [NSMutableArray new];
    for (int i = 0; i<arr.count; i++) {
        NewsAllDataImgModel *model = arr[i];
        [Arr addObject:[NSURL URLWithString:model.imgsrc]];
    }
    return [Arr copy];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].imgsrc];
}
- (NSString *)digestForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].digest;
}
- (NSString *)replyCountForRow:(NSInteger)row{
    NSInteger count = [self modelForArr:self.dataArr row:row].replyCount;
    if (count>=10000) {
        return [NSString stringWithFormat:@"%.1lf万跟帖",(double)(count/1000)/10];
    }else{
        return [NSString stringWithFormat:@"%ld跟帖",count];
    }
}

//ads数组
- (NSString *)titleForRowInAds:(NSInteger)row{
    return [self modelForArr:self.adsArr row:row].title;
}
- (NSURL *)iconURLForRowInAds:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.adsArr row:row].imgsrc];
}
//- (NSString *)detailURLForRowInAds:(NSInteger)row{
//    return [NSURL URLWithString:[self modelForArr:self.adsArr row:row].url];
//}
/** 更新数据 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    if (_type == 0) {
        _start = 0;
        _index = 140;
    }else{
        _start = 0;
        _index = 20;
    }
    
    [self getDataFromNetCompleteHandle:completionHandle];

}
/** 获取更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (_type == 0){
        count += 20;
        _start = 120+count;
        _index = 20;
    }else{
        _start += 20;
        _index = 20;
    }
    [self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取数据 */
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    //根据type的索引来取不同的
    switch (_type) {
        case InfoTypeHeadLine: {
            self.dataTask = kNewsNetManager(0,140,NewsAllModel, data);
            break;
        }
        case InfoTypeYuLe: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeHot: {
            self.dataTask = kNewsNetManager(0,0,NewsAllModel, data);
            break;
        }
        case InfoTypeSports: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeScience: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeEconomics: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeFashion: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeMilitary: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        case InfoTypeHappyTime: {
            self.dataTask = kNewsNetManager(0,20,NewsAllModel, data);
            break;
        }
        default: {
            break;
        }
    }
}
@end
