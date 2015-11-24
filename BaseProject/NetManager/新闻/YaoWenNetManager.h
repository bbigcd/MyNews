//
//  YaoWenNetManager.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "YaoWenModel.h"
@interface YaoWenNetManager : BaseNetManager
+ (id)getYaoWenWithStart:(NSInteger)start index:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
