//
//  ReadViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReadViewController.h"
#import "NYSegmentedControl.h"
#import "SubViewController.h"

@interface ReadViewController ()
@property (nonatomic, strong)UISegmentedControl * segmented;
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
        [segmented setBackgroundImage:[UIImage imageNamed:@"specialcell_nav_btn"] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
        segmented.layer.cornerRadius = 13;
        [segmented insertSegmentWithTitle:@"推荐阅读" atIndex:0 animated:YES];
        [segmented insertSegmentWithTitle:@"我的订阅" atIndex:1 animated:YES];
        
        [segmented addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
//        [segmented setMomentary:YES];//YES：点击不保留高亮
        segmented.selectedSegmentIndex = 0;//进入即显示0
        _segmented = segmented;
        self.navigationItem.titleView = segmented;
    }
    return self;
}
- (void)changeView{
//    NSLog(@"%ld",self.segmented.selectedSegmentIndex);
    if (self.segmented.selectedSegmentIndex == 0) {
        if (self.segmented.selectedSegmentIndex == 1) {
            [self.view removeFromSuperview];
        }
        ReadViewController *vc1 = [[ReadViewController alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc1];
        [self.view addSubview:navi.view];
    }
    if (self.segmented.selectedSegmentIndex == 1) {
        if (self.segmented.selectedSegmentIndex == 0) {
            [self.view removeFromSuperview];
        }
        SubViewController *vc2 = [[SubViewController alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc2];
        [self.view addSubview:navi.view];
    }
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_navigation_readerplus"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    UILabel *label = [UILabel new];
    label.text = @"推荐阅读";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}
- (void)clickRightItem{
    NSLog(@"...");
}
@end
