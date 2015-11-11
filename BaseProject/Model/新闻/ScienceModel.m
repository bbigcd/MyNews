//
//  ScienceModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ScienceModel.h"

@implementation ScienceModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348649580692" : [ScienceT1348649580692Model class]};
}
@end
@implementation ScienceT1348649580692Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [ScienceT1348649580692AdsModel class],@"imgextra":[ScienceT1348649580692imgextraModel class]};
}

@end


@implementation ScienceT1348649580692AdsModel

@end

@implementation ScienceT1348649580692imgextraModel


@end
