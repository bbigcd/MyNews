//
//  ReadViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReadViewController.h"
@interface ReadViewController ()
@end
@implementation ReadViewController
- (id)initTitleName:(NSString *)name{
    if (self = [super init]) {
        self.tabBarItem.title = name;
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_reader_normal"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_reader_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
        UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 193, 26)];
        //    [segmented setBackgroundImage:[UIImage imageNamed:@"specialcell_nav_btn"] forState:UIControlStateFocused barMetrics:UIBarMetricsDefault];
        [segmented insertSegmentWithTitle:@"推荐阅读" atIndex:0 animated:YES];
        [segmented insertSegmentWithTitle:@"我的订阅" atIndex:1 animated:YES];
        [segmented addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
//        [segmented setMomentary:YES];//YES：点击不保留高亮
        UIBarButtonItem *seg = [[UIBarButtonItem alloc]initWithCustomView:segmented];
//        self.navigationItem.leftBarButtonItem =seg;
//        self.navigationItem. = @[,seg];

    }
    return self;
}
- (void)changeView{
    NSLog(@"...");
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_navigation_readerplus"] style:UIBarButtonItemStylePlain target:nil action:@selector(clickRightItem)];
}
- (void)clickRightItem{
    NSLog(@"...");
}
@end
