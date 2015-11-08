//
//  TabBarViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationViewController.h"
#define kRootVC(ViewController,NSString) [[NavigationViewController alloc]initWithRootViewController:[[ViewController alloc]initTitleName:NSString]]
@implementation TabBarViewController
/** tabBar控制器 */
- (UITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[UITabBarController alloc]init];
        //五个子控制器，
//        [_tabBarController addChildViewController:kRootVC(NewsViewController, @"新闻")];
        [_tabBarController addChildViewController:[NewsViewController standarTuWanNavi]];
        [_tabBarController addChildViewController:kRootVC(ReadViewController,@"阅读")];
        [_tabBarController addChildViewController:kRootVC(AudioViewController,@"视听")];
        [_tabBarController addChildViewController:kRootVC(DiscoverViewController, @"发现")];
        [_tabBarController addChildViewController:kRootVC(MyViewController,@"我")];
        
    }
    return _tabBarController;
}

+ (void)initialize{
    if (self == [TabBarViewController class]) {
        // 0.获取TabBar的外观
        UITabBar *tabBar = [UITabBar appearance];
        /** tabBar的阴影 */
        [tabBar setShadowImage:[UIImage imageNamed:@"tabbar_shadow"]];
        
        
        // 获取UITabBarItem的风格
        UITabBarItem *barItem = [UITabBarItem appearance];
        // 1.设置item中文字的位置
        [barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        
        // 2.设置item中文字的普通样式
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:kTabBarTitleFontSize];
        [barItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
        
        // 3.设置item中文字被选中时的样式
        NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
        selectedAttrbiutes[NSForegroundColorAttributeName] = [UIColor colorWithRed:255 green:0 blue:0 alpha:1];
//        selectedAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [barItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
        
    }
}
- (void)viewDidLoad{
    [super viewDidLoad];
}
@end
