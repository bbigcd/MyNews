//
//  NewsViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsListViewController.h"
@interface NewsViewController ()
@end
@implementation NewsViewController
- (id)initTitleName:(NSString *)name{
    if (self = [super init]) {
        self.tabBarItem.title = name;
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_news_normal"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_news_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
    }
    return self;
}
//
//+ (UINavigationController *)standarTuWanNavi{
//    /** 单例模式，确保每次进入程序只有一个NewsVC */
//    static UINavigationController *navi = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        //重新初始化
//        NewsViewController *vc  = [[NewsViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
//        //例如设置第一个控制器的某个属性的值
//        //vc setValues:[values[0]] forKey:keys[0]
//        vc.keys = [self vcKeys];
//        vc.values = [self vcValues];
//        navi = [[UINavigationController alloc]initWithRootViewController:vc];
//    });
//    return navi;
//}
///**
// *  第三方框架
// *
// *  @return 提供每个vc对应的values值数组
// */
//+ (NSArray *)vcValues{
//    NSMutableArray *arr = [NSMutableArray new];
//    for (int i = 0; i<[self itemNames].count; i++) {
////数值上，vc的infoType的枚举值，恰好和i值相同
//        [arr addObject:@(i)];
//    }
//    return arr;
//}
///** 提供每个vc对应的key值数组 */
//+ (NSArray *)vcKeys{
//    NSMutableArray *arr = [NSMutableArray new];
//    for (id obj in [self itemNames]) {
//        [arr addObject:@"infoType"];
//    }
//    return [arr copy];
//}
//
///**
// *  存放导航栏名称
// *
// *  @return 存放导航栏名称的数组
// */
//+ (NSArray *)itemNames{
//    return @[@"头条",@"娱乐",@"热点",@"体育",@"广州",@"财经",@"科技"];
//}
///**
// *  存放新闻页面的子控制器
// *
// *  @return 子控制器数组
// */
//+ (NSArray *)viewControllerClasses{
//    NSMutableArray *arr = [NSMutableArray new];
//    for (id obj in [self itemNames]) {
//        [arr addObject:[NewsListViewController class]];
//    }
//    return [arr copy];
//}

- (void)viewDidLoad {
//    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = nil;
    self.view.backgroundColor = [UIColor whiteColor];
    
}
@end
