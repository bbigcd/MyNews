//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TabBarViewController.h"
//#import "NewsDetailNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //根视图控制器
    self.window.rootViewController = [TabBarViewController new].tabBarController;
//    NSString *docid = @"B7J6N4FL00031H2L";
//    [NewsDetailNetManager getNewsDetailWithDocid:docid completionHandle:^(id model, NSError *error) {
//        DDLogVerbose(@"。。");
//    }];

    
    
    
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
