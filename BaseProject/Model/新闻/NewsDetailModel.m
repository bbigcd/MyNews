//
//  NewsDetailModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsDetailModel.h"

@implementation NewsDetailModel
/** 便利构造器 */
+ (instancetype)detailWithDict:(NSDictionary *)dict
{
    NewsDetailModel *detail = [[self alloc]init];
    detail.title = dict[@"title"];
    detail.ptime = dict[@"ptime"];
    detail.body = dict[@"body"];
    
    NSArray *imgArray = dict[@"img"];
    NSMutableArray *temArray = [NSMutableArray arrayWithCapacity:imgArray.count];
    
    for (NSDictionary *dict in imgArray) {
        NewsDetailImgModel *imgModel = [NewsDetailImgModel detailImgWithDict:dict];
        [temArray addObject:imgModel];
    }
    detail.img = temArray;
    
    
    return detail;
}
@end

@implementation NewsDetailImgModel
/** 便利构造器方法 */
+ (instancetype)detailImgWithDict:(NSDictionary *)dict
{
    NewsDetailImgModel *imgModel = [[self alloc]init];
    imgModel.ref = dict[@"ref"];
    imgModel.pixel = dict[@"pixel"];
    imgModel.src = dict[@"src"];
    
    return imgModel;
}



@end