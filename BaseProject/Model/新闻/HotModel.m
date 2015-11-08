//
//  HotModel.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"tuiJian":@"推荐"};
}

+ (NSDictionary *)objectClassInArray{
    return @{@"tuiJian" : [HottuiJianModel class]};
}
@end
@implementation HottuiJianModel

@end


