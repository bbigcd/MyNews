//
//  SportsModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SportsModel.h"

@implementation SportsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348649079062" : [SportsT1348649079062Model class]};
}
@end
@implementation SportsT1348649079062Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [SportsT1348649079062AdsModel class],@"imgextra":[SportsT1348649079062imgextraModel class]};
}

@end


@implementation SportsT1348649079062AdsModel

@end

@implementation SportsT1348649079062imgextraModel


@end

