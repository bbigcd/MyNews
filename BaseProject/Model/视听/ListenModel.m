//
//  ListenModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ListenModel.h"

@implementation ListenModel



+ (NSDictionary *)objectClassInArray{
    return @{@"cList" : [ListenClistModel class]};
}
@end



@implementation ListenClistModel

+ (NSDictionary *)objectClassInArray{
    return @{@"tList" : [ListenClistTlistModel class]};
}

@end


@implementation ListenClistTlistModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Template":@"template"};
}
@end


@implementation ListenClistTlistRadioModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Template":@"template"};
}
@end


