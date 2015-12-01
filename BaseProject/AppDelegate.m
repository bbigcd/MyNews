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
//#import "NewsReplyNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //根视图控制器
    self.window.rootViewController = [TabBarViewController new].tabBarController;
//    NSString *f = @"news3_bbs";
//    NSString *l = @"B9H3AG4600014AED";
//    news3_bbs  B9H3AG4600014AED  0
//    [NewsReplyNetManager getReplyWithBoardIDAndDocid:f docid:l index:0 completionHandle:^(id model, NSError *error) {
//        DDLogVerbose(@"....");
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
