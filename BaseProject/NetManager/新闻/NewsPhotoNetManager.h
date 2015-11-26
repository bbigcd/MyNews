//
//  NewsPhotoNetManager.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsPhotoModel.h"
@interface NewsPhotoNetManager : BaseNetManager
/**
 *  photosetID   54GI0096|82934
 *
 *  @param first            父视图传下来的：0096
 *  @param last             父视图传下来的：82934
 *
 *  @return 请求所在任务
 */
+ (id)getYaoWenWithPhotosetID:(NSString *)first index:(NSString *)last completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
