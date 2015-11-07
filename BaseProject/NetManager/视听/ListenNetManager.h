//
//  ListenNetManager.h
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ListenModel.h"
@interface ListenNetManager : BaseNetManager
//http://c.m.163.com/nc/topicset/ios/radio/index.html
+ (id)getListenWithIndex:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
