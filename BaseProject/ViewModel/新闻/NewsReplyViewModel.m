
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

//预防性编程，防止没有使用initWithBoardIDAndDocid初始化
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
- (NewsReplyDataModel *)modelInReplyDataForRow:(NSInteger)row{
    if (self.dataArr.count == 0) {
        return nil;
    }
    return self.dataArr[row];
}
- (NSString *)nameForRow:(NSInteger)row{
    if ([self modelInReplyDataForRow:row].detail.n == nil) {
        return [self modelInReplyDataForRow:row].detail.n = @"火星网友";
    }else{
        return [self modelInReplyDataForRow:row].detail.n;
    }
}
- (NSString *)addressForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].detail.f;
}
- (NSString *)sayForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].detail.b;
}
- (NSString *)supposeForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].detail.v;
}
- (NSString *)headForRow:(NSInteger)row{
    return [self modelInReplyDataForRow:row].detail.timg;
}


- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index += 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//   news3_bbs  B9H3AG4600014AED  0 http://comment.api.163.com/api/json/post/list/new/hot/news3_bbs/B9H3AG4600014AED/0/10/10/2/2
//           最新评论               http://comment.api.163.com/api/json/post/list/new/normal/news3_bbs/B9GB3L4R00014AED/desc/0/10/10/2/2
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [NewsReplyNetManager getReplyWithBoardIDAndDocid:_boardid docid:_docid index:_index completionHandle:^(NewsReplyModel *model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model.hotPosts];
        }
        completionHandle(error);
    }];
}
@end
