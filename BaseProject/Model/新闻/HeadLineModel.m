//
//  HeadLineModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadLineModel.h"

@implementation HeadLineModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348647853363" : [HeadLineT1348647853363Model class]};
}
@end
@implementation HeadLineT1348647853363Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [HeadLineT1348647853363AdsModel class], @"imgextra" : [HeadLineT1348647853363ImgextraModel class]};
}
@end


@implementation HeadLineT1348647853363AdsModel

@end


@implementation HeadLineT1348647853363ImgextraModel

@end


