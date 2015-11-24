//
//  YaoWenNetManager.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenNetManager.h"

@implementation YaoWenNetManager
//http://c.3g.163.com/nc/article/list/T1429173683626/0-20.html
+ (id)getYaoWenWithStart:(NSInteger)start index:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1429173683626/%ld-%ld.html",(long)start,(long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([YaoWenModel mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
