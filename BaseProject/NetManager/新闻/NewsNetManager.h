//
//  NewsNetManager.h
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
/** 在新闻Model层中专门创建的头文件，目的只有一个，方便其他类引入多玩的全部头文件 */
//排序 头条 娱乐 热点 体育 科技 经济 时尚 军事 轻松一刻

#import "NewsAllModel.h"
typedef NS_ENUM(NSUInteger,InfoType) {
    InfoTypeHeadLine, //头条
    InfoTypeYuLe,  //娱乐
    InfoTypeHot,   //热点
    InfoTypeSports,  //体育
    InfoTypeScience,  //科技
    InfoTypeEconomics,  //财经
    InfoTypeFashion,  //时尚
    InfoTypeMilitary,  //军事
    InfoTypeHappyTime   //轻松一刻
};

@interface NewsNetManager : BaseNetManager
/**
 *  获取新闻列表
 *
 *  @param type 请求新闻类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getNewsInfoWithType:(InfoType)type start:(NSInteger)start index:(NSInteger)index kCompletionHandle;



@end
