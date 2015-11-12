//
//  NewsNetManager.m
//  网易新闻
//
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsNetManager.h"
//很多具有共同点的东西，可以统一宏定义, 凡是自己写的宏定义 都需要用k开头，这是编码习惯


//把path写到文件头部，使用宏定义形势。 方便后期维护
//把所有路径宏定义封装到DuoWanRequestPath.h文件中
#import "NewsRequestPath.h"
@implementation NewsNetManager
+ (id)getNewsInfoWithType:(InfoType)type start:(NSInteger)start index:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = nil;
    switch (type) {
        case InfoTypeHeadLine: {
            path = [NSString stringWithFormat:kHeadLinePath,(long)start,(long)index];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([HeadLineModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeYuLe: {
            path = [NSString stringWithFormat:kYuLePath,(long)start,(long)index];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([YuLeModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeHot: {
            path = [NSString stringWithFormat:kHotPath];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([HotModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeSports: {
            path = [NSString stringWithFormat:kSportsPath,(long)start,(long)index];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([SportsModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeScience: {
            path = [NSString stringWithFormat:kSciencePath,(long)start,(long)index];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([ScienceModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case InfoTypeEconomics: {
            path = [NSString stringWithFormat:kEconomicsPath,(long)start,(long)index];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([EconomicsModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
}
@end
