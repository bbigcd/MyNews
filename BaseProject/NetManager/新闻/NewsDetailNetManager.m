//
//  NewsDetailNetManager.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsDetailNetManager.h"

@implementation NewsDetailNetManager
+ (instancetype)manager{
    NewsDetailNetManager *detail = [super manager];
    NSMutableSet *detailSet = [NSMutableSet set];
    detailSet.set = detail.responseSerializer.acceptableContentTypes;
    [detailSet addObject:@"text/html"];
    detail.responseSerializer.acceptableContentTypes = detailSet;
    return detail;
}

@end
