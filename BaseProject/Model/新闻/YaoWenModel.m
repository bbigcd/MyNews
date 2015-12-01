//
//  YaoWenModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenModel.h"

@implementation YaoWenModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"data":@"T1429173683626"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [YaoWenDataModel class]};
}
@end
@implementation YaoWenDataModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ktemplate":@"template"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"imgextra" : [YaoWenDataImModel class]};
}
@end

@implementation YaoWenDataImModel


@end

