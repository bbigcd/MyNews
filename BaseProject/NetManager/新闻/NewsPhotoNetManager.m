//
//  NewsPhotoNetManager.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsPhotoNetManager.h"

@implementation NewsPhotoNetManager
+ (id)getYaoWenWithPhotosetID:(NSString *)first index:(NSString *)last completionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json",first,last];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NewsPhotoModel mj_objectWithKeyValues:responseObj],error);
    }];
}
@end
