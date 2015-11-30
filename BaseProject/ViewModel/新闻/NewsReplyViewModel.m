
//
//  NewsReplyViewModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyViewModel.h"
#import "NewsReplyNetManager.h"
@implementation NewsReplyViewModel
- (instancetype)initWithBoardIDAndDocid:(NSString *)boardid docid:(NSString *)docid{
    if (self = [super init]) {
        _boardid = boardid;
        _docid = docid;
        _index = 0;
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
- (replyData *)modelInReplyDataForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (NSString *)nameForRow:(NSInteger)row{
    if ([self modelInReplyDataForRow:row].n == nil) {
        return [self modelInReplyDataForRow:row].n = @"火星网友";
    }else{
        return [self modelInReplyDataForRow:row].n;
    }
}
- (NSString *)addressForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].a;
}
- (NSString *)sayForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].b;
}
- (NSString *)supposeForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].v;
}



- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [NewsReplyNetManager getReplyWithBoardIDAndDocid:_boardid docid:_docid index:(NSInteger)index completionHandle:^(NewsReplyModel *model, NSError *error) {
        if (_index==0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObject:model];
        completionHandle(error);
    }];
}
@end
