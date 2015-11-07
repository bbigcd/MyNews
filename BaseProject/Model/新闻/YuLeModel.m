//
//  YuLeModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YuLeModel.h"

@implementation YuLeModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348648517839" : [YuLeT1348648517839Model class]};
}
@end
@implementation YuLeT1348648517839Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [YuLeT1348648517839AdsModel class]};
}

@end


@implementation YuLeT1348648517839AdsModel

@end


