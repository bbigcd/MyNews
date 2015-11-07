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
typedef NS_ENUM(NSUInteger,FirstType) {
    FirstTypeScience,  //科技
    FirstTypeEconomics,  //财经
};
typedef NS_ENUM(NSUInteger,SecondType) {
    SecondTypeHeadLine, //头条
    SecondTypeSports,  //体育
    SecondTypeYuLe,  //娱乐
};

@interface NewsNetManager : BaseNetManager
/**
 *  获取科技或财经新闻列表，因为科技和财经请求串十分相似，所以可以合写
 *
 *  @param type 请求新闻类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getSEWithType:(FirstType)type index:(NSInteger)index kCompletionHandle;

/**
 *  获取头条或体育或娱乐新闻列表，因为头条、体育和娱乐请求串十分相似，所以可以合写
 *
 *  @param type 请求新闻类型
 *
 *  @return 当前请求所在任务
 */
+ (id)getHSYWithType:(SecondType)type  index:(NSInteger)index kCompletionHandle;

//热点

//+ (id)getHotWith

















@end
