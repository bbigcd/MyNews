//
//  EconomicsModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "EconomicsModel.h"

@implementation EconomicsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348648756099" : [EconomicsT1348648756099Model class]};
}
@end
@implementation EconomicsT1348648756099Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [EconomicsT1348648756099AdsModel class],@"imgextra":[EconomicsT1348648756099imgextraModel class]};
}

@end


@implementation EconomicsT1348648756099AdsModel

@end

@implementation EconomicsT1348648756099imgextraModel



@end
