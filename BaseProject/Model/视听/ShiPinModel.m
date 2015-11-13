//
//  ShiPinModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinModel.h"

@implementation ShiPinModel
+ (NSDictionary *)objectClassInArray{
    return @{@"VAP4BFE3U" : [Vap4Bfe3U class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"VAP4BFE3U":@[@"VAP4BFE3U",@"VAP4BFR16",@"VAP4BG6DL",@"VAP4BGTVD"]};
}
@end
@implementation Vap4Bfe3U
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"kdescription":@"description"};
}
@end


