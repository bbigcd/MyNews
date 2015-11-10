//
//  NavigationViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NavigationViewController.h"

@implementation NavigationViewController

/* 第一次使用这个类或者这个子类时自动执行  */

+ (void)initialize
{
    if (self == [NavigationViewController class])
    {
        // 0.获取导航条外观
        UINavigationBar *bar = [UINavigationBar appearance];
        // 1.设置背景色
        [bar setBarTintColor:kNavibackgroundColor];
//        [bar setBarTintColor:[UIColor redColor]];
        
        // 3.设置左右按钮的文字颜色
        [bar setTintColor:[UIColor whiteColor]];
        
        // 4.设置标题文字的垂直位置
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        
        // 5.设置导航栏的样式--影响状态栏中文字的颜色 即电池栏
        /** 这种方法设置无法满足要求，因为在“我”控制器中NAVI被隐藏了，解决方法，在info.plist中添加一个新key，名字为View controller-based status bar appearance,并将其值设为NO
         然后就可以在合适的位置设置全局状态栏的显示样式
         */
//        [bar setBarStyle:UIBarStyleBlack];
        
        // 6.设置标题栏文字的样式
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:kNaviTitleFontSize];
        attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [bar setTitleTextAttributes:attributes];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
@end
