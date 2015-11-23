//
//  NewsDetailModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsDetailModel.h"

@implementation NewsDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"data":@"B7J6N4FL00031H2L"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [NewsDetailDataModel class]};
}

@end

@implementation NewsDetailDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ktemplate":@"template"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"img" : [NewsDetailDataImgModel class], @"topiclist" : [NewsDetailDataTopiclistModel class], @"topiclist_news" : [NewsDetailDataTopiclist_NewsModel class]};
}
+ (instancetype)detailWithDict:(NSDictionary *)dict
{
    NewsDetailDataModel *detail = [[self alloc]init];
    detail.title = dict[@"title"];
    detail.ptime = dict[@"ptime"];
    detail.body = dict[@"body"];
    
    NSArray *imgArray = dict[@"img"];
    NSMutableArray *temArray = [NSMutableArray arrayWithCapacity:imgArray.count];
    
    for (NSDictionary *dict in imgArray) {
        NewsDetailDataImgModel *imgModel = [NewsDetailDataImgModel detailImgWithDict:dict];
        [temArray addObject:imgModel];
    }
    detail.img = temArray;
    
    
    return detail;
}
@end


@implementation NewsDetailDataImgModel
+ (instancetype)detailImgWithDict:(NSDictionary *)dict
{
    NewsDetailDataImgModel *imgModel = [[self alloc]init];
    imgModel.ref = dict[@"ref"];
    imgModel.pixel = dict[@"pixel"];
    imgModel.src = dict[@"src"];
    
    return imgModel;
}
@end


@implementation NewsDetailDataTopiclistModel

@end


@implementation NewsDetailDataTopiclist_NewsModel

@end


