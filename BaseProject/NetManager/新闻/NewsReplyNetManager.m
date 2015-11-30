//
//  NewsReplyNetManager.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyNetManager.h"

@implementation NewsReplyNetManager
+ (id)getReplyWithBoardIDAndDocid:(NSString *)boardid docid:(NSString *)docid index:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://comment.api.163.com/api/json/post/list/new/hot/%@/%@/%ld/10/10/2/2",boardid,docid,(long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NewsReplyModel mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
