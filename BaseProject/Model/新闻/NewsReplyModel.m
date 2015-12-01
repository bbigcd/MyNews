//
//  NewsReplyModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyModel.h"

@implementation NewsReplyModel


+ (NSDictionary *)objectClassInArray{
    return @{@"hotPosts" : [NewsReplyDataModel class]};
}
@end
@implementation NewsReplyDataModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"detail":@"1",@"detail2":@"2"};
}
@end


@implementation NewsReplyDataDetailModel

@end

@implementation NewsReplyDataDetail2Model


@end
