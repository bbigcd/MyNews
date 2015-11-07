//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "VideoNetManager.h"
#import "NewsNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    /*
    [VideoNetManager getVideoWithIndex:0 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getSEWithType:FirstTypeScience index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getSEWithType:FirstTypeEconomics index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getHSYWithType:SecondTypeYuLe index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getHSYWithType:SecondTypeSports index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getHSYWithType:SecondTypeHeadLine index:0 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
     */
    
    
    
    
    
    
    
    return YES;
}

@end
