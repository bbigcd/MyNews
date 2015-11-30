//
//  NewsViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsListViewController.h"
#import "WeatherViewController.h"
#import "YaoWenViewController.h"
@interface NewsViewController ()
@property (nonatomic, strong)UIButton * rightItem;
@property(nonatomic,assign,getter=isWeatherShow)BOOL weatherShow;

@end
@implementation NewsViewController
+ (UINavigationController *)standarTuWanNavi{
    /** 单例模式，确保每次进入程序只有一个NewsVC */
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //重新初始化
        NewsViewController *vc  = [[NewsViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值
        //vc setValues:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        vc.titleColorSelected = kRGBColor(167, 27, 46);
        vc.tabBarItem.title = @"新闻";
        [vc.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_news_normal"]];
        [vc.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_news_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = selectedImage;
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
/**
 *  第三方框架
 *
 *  @return 提供每个vc对应的values值数组
 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i<[self itemNames].count; i++) {
//数值上，vc的infoType的枚举值，恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个vc对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/**
 *  存放导航栏名称
 *
 *  @return 存放导航栏名称的数组
 */
+ (NSArray *)itemNames{
    return @[@"头条",@"娱乐",@"热点",@"体育",@"科技",@"财经",@"时尚",@"军事",@"搞笑"];
}
/**
 *  存放新闻页面的子控制器
 *
 *  @return 子控制器数组
 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[NewsListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *rightItem = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24.5, 24.5)];
//    UIButton *rightItem = [[UIButton alloc]init];
//    CGRect frame = rightItem.frame;
//    frame.size.width = 45;
//    frame.size.height = 45;
//    rightItem.frame = frame;
    self.rightItem = rightItem;
    [rightItem addTarget:self action:@selector(clickRightItem) forControlEvents:UIControlEventTouchUpInside];
//    UIWindow *win = [UIApplication sharedApplication].windows.firstObject;
//    [win addSubview:rightItem];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightItem];
    [rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
    
    
    
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_navi_bell_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftItem)];
    self.navigationItem.leftBarButtonItem = item2;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbar_netease"]];
}
- (void)clickRightItem{

    if (self.isWeatherShow) {
//        self.weatherView.hidden = YES;
//        self.tran.hidden = YES;
        [UIView animateWithDuration:0.1 animations:^{
            self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI * 5);
//            NSLog(@"%@",NSStringFromCGRect(self.rightItem.frame));
            
        } completion:^(BOOL finished) {
            [self.rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
//            NSLog(@"%@",NSStringFromCGRect(self.rightItem.frame));
        }];
    }else{
//        self.weatherView.hidden = NO;
//        self.tran.hidden = NO;
//        [self.weatherView addAnimate];
        [self.rightItem setImage:[UIImage imageNamed:@"top_navigation_close"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.2 animations:^{
            self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, -M_1_PI * 6);
//            NSLog(@"%@",NSStringFromCGRect(self.rightItem.frame));
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI );
//                NSLog(@"%@",NSStringFromCGRect(self.rightItem.frame));
            }];
        }];
    }
    self.weatherShow = !self.isWeatherShow;
}
- (void)clickLeftItem{
//    UINavigationController *navi= [[UINavigationController alloc]initWithRootViewController:[YaoWenViewController new]];
    YaoWenViewController *vc = [YaoWenViewController new];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
