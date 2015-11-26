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
//#import "NewsPhotoNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //根视图控制器
    self.window.rootViewController = [TabBarViewController new].tabBarController;
//    NSString *f = @"0096";
//    NSString *l = @"82934";
//    [NewsPhotoNetManager getYaoWenWithPhotosetID:f index:l completionHandle:^(id model, NSError *error) {
//        DDLogVerbose(@"...");
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
