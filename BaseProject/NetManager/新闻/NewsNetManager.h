//
//  NewsNetManager.h
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
/** 在新闻Model层中专门创建的头文件，目的只有一个，方便其他类引入多玩的全部头文件 */
#import "NewsModel.h"
typedef NS_ENUM(NSUInteger,InfoType) {
    InfoTypeHeadLine, //头条
    InfoTypeYuLe,  //娱乐
    InfoTypeHot,   //热点
    InfoTypeSports,  //体育
    InfoTypeScience,  //科技
    InfoTypeEconomics,  //财经
};

@interface NewsNetManager : BaseNetManager
/**
 *  获取新闻列表
 *
 *  @param type 请求新闻类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getNewsInfoWithType:(InfoType)type index:(NSInteger)index kCompletionHandle;



















@end
