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
#import "TabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //根视图控制器
    self.window.rootViewController = [TabBarViewController new].tabBarController;
   /*
    [NewsNetManager getNewsInfoWithType:InfoTypeHeadLine index:0 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getNewsInfoWithType:InfoTypeYuLe index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getNewsInfoWithType:InfoTypeHot index:0 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getNewsInfoWithType:InfoTypeSports index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getNewsInfoWithType:InfoTypeScience index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    [NewsNetManager getNewsInfoWithType:InfoTypeEconomics index:20 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"...");
    }];
    */
    
    
    
    
    
    
    return YES;
}

/** window初始化 */
- (UIWindow *)window {
    if(_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

@end
