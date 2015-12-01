//
//  YaoWenViewModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenViewModel.h"

@implementation YaoWenViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (YaoWenDataModel *)modelForRow:(NSInteger)row{
    if (self.dataArr.count==0) {
        [self showErrorMsg:@"网络无连接"];
        return nil;
    }
    return self.dataArr[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
- (NSString *)digestForRow:(NSInteger)row{
    return [self modelForRow:row].digest;
}
- (NSString *)replyCountForRow:(NSInteger)row{
    NSInteger count = [self modelForRow:row].replyCount;
    if (count>=10000) {
        return [NSString stringWithFormat:@"%.1lf万跟帖",(double)(count/1000)/10];
    }else{
        return [NSString stringWithFormat:@"%ld跟帖",count];
    }
}
- (NSInteger)replyCountDetailForRow:(NSInteger)row{
    return [self modelForRow:row].replyCount;
}
- (NSString *)docidForRow:(NSInteger)row{
    return [self modelForRow:row].docid;
}
- (NSString *)boardidForRow:(NSInteger)row{
    return [self modelForRow:row].boardid;
}
- (NSString *)photosetIDForRow:(NSInteger)row{
    return [self modelForRow:row].photosetID;
}
- (NSArray *)iconsURLSForRow:(NSInteger)row{
    NSArray *arr = [self modelForRow:row].imgextra;
    NSMutableArray *Arr = [NSMutableArray new];
    for (int i = 0; i<arr.count; i++) {
        YaoWenDataImModel *model = arr[i];
        [Arr addObject:[NSURL URLWithString:model.imgsrc]];
    }
    return [Arr copy];
}
- (BOOL)isHtmlForRow:(NSInteger)row{
    return [self modelForRow:row].TAG == nil && [self modelForRow:row].skipType == nil;
}
- (BOOL)isPicForRow:(NSInteger)row{
    return [[self modelForRow:row].skipType isEqualToString:@"photoset"];
}
- (BOOL)isVideoForRow:(NSInteger)row{
    return [[self modelForRow:row].TAG isEqualToString:@"视频"];
}
- (BOOL)isSpecialForRow:(NSInteger)row{
    return [[self modelForRow:row].skipType isEqualToString:@"special"];
}
- (BOOL)isDuJiaForRow:(NSInteger)row{
    return [[self modelForRow:row].TAG isEqualToString:@"独家"];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [YaoWenNetManager getYaoWenWithStart:_start index:_index completionHandle:^(YaoWenModel *model, NSError *error) {
        if (self.start == 0 && self.index == 20) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}
/** 更新数据 */
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
        _start = 0;
        _index = 20;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
/** 获取更多 */
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
        _start += 20;
        _index = 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end
