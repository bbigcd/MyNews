//
//  TabBarViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TabBarViewController.h"
#define kRootVC [[UINavigationController alloc]initWithRootViewController
@implementation TabBarViewController
/** tabBar控制器 */
- (UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc]init];
        //五个子控制器，
        [_tabBarController addChildViewController:kRootVC:[NewsViewController new]]];
        [_tabBarController addChildViewController:kRootVC:[AudioViewController new]]];
    }
    return _tabBarController;
}
@end
