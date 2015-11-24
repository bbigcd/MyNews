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
