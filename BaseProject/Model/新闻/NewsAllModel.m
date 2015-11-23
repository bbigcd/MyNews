//
//  NewsAllModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsAllModel.h"

@implementation NewsAllModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    /**
     *  排序 头条 娱乐 热点 体育 科技 经济 时尚 军事 轻松一刻
     */
    return @{@"data":@[@"T1348647853363",
                       @"T1348648517839",
                       @"推荐",
                       @"T1348649079062",
                       @"T1348649580692",
                       @"T1348648756099",
                       @"T1348650593803",
                       @"T1348648141035",
                       @"T1350383429665"
                       ]};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [NewsAllDataModel class]};
}
@end

@implementation NewsAllDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"tuiJian":@"推荐",
             @"ktemplate":@"template"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [NewsAllDataImgModel class], @"imgextra" : [NewsAllDataImgUrlModel class]};
}
@end


@implementation NewsAllDataImgModel

@end


@implementation NewsAllDataImgUrlModel

@end
