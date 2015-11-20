//
//  ListenNetManager.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListenNetManager.h"

@implementation ListenNetManager
+ (id)getListenWithIndex:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://c.m.163.com/nc/topicset/ios/radio/index.html"];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ListenModel mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
