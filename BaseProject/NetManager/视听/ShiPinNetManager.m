
//
//  ShiPinNetManager.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinNetManager.h"

@implementation ShiPinNetManager
+ (id)getShiPinWithSid:(NSString *)sid index:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path  = [NSString stringWithFormat:@"http://c.3g.163.com/nc/video/list/%@/y/0-%ld.html",sid,(long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ShiPinModel objectWithKeyValues:responseObj],error);
    }];
}
@end
