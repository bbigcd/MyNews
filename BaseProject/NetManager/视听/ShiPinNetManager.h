//
//  ShiPinNetManager.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ShiPinModel.h"
@interface ShiPinNetManager : BaseNetManager
//http://c.3g.163.com/nc/video/list/VAP4BFE3U/y/0-10.html
+ (id)getShiPinWithSid:(NSString *)sid index:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
