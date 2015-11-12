//
//  AudioViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AudioViewController.h"
#import "ListenViewController.h"
@interface AudioViewController ()
@property (nonatomic, strong)UISegmentedControl * segmented;
@end
@implementation AudioViewController
- (id)initTitleName:(NSString *)name{
    if (self = [super init]) {
        self.tabBarItem.title = name;
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_media_normal"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_media_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
        UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 193, 26)];
        
        [segmented setBackgroundImage:[UIImage imageNamed:@"specialcell_nav_btn"] forState:UIControlStateFocused barMetrics:UIBarMetricsDefault];
        segmented.layer.cornerRadius = 13;
        [segmented insertSegmentWithTitle:@"视频" atIndex:0 animated:YES];
        [segmented insertSegmentWithTitle:@"电台" atIndex:1 animated:YES];
        [segmented addTarget:self action:@selector(changeView) forControlEvents:UIControlEventValueChanged];
//        [segmented setMomentary:YES];//YES：点击不保留高亮
        segmented.selectedSegmentIndex = 0;
        _segmented = segmented;
        self.navigationItem.titleView = segmented;
    }
    return self;
}
- (void)changeView{
    NSLog(@"%ld",self.segmented.selectedSegmentIndex);
    if (self.segmented.selectedSegmentIndex == 0) {
        if (self.segmented.selectedSegmentIndex == 1) {
            [self.view removeFromSuperview];
        }
        AudioViewController *vc2 = [[AudioViewController alloc]init];
        [self.view addSubview:vc2.view];
    }
    if (self.segmented.selectedSegmentIndex == 1) {
        if (self.segmented.selectedSegmentIndex == 0) {
            [self.view removeFromSuperview];
        }
        ListenViewController *vc1 = [[ListenViewController alloc]init];
        [self.view addSubview:vc1.view];
    }
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [UILabel new];
    label.text = @"视频";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

@end
