//
//  ReadViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReadViewController.h"
#import "TestViewController.h"
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
        
        //配置segmented
        _segmented = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 193, 26)];
        [_segmented setBackgroundImage:[UIImage imageNamed:@"specialcell_nav_btn"] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
        _segmented.layer.cornerRadius = 13;
        [_segmented insertSegmentWithTitle:@"推荐阅读" atIndex:0 animated:YES];
        [_segmented insertSegmentWithTitle:@"我的订阅" atIndex:1 animated:YES];
        [_segmented bk_addEventHandler:^(id sender) {
//            NSLog(@"%ld",_segmented.selectedSegmentIndex);
            if (self.segmented.selectedSegmentIndex == 0) {
                ReadViewController *vc1 = [[ReadViewController alloc]init];
                [self.view addSubview:vc1.view];
                //用addSubview会导致自身的控制器指向为nil，所以在vc1.view里面的所有由控制器（self.navigationcontroller为nil）的跳转变为：一个nil跳转，即无效操作
                //需要向父视图里面添加子控制器，如下   --- （视听）里面一样
                // ******---跳转必须是由控制器跳转,视图无法完成跳转------******
                [self addChildViewController:vc1];
            }
            if (self.segmented.selectedSegmentIndex == 1) {
                SubViewController *vc2 = [[SubViewController alloc]init];
                [self.view addSubview:vc2.view];
                [self addChildViewController:vc2];
            }
        } forControlEvents:UIControlEventValueChanged];
        
//        [segmented setMomentary:YES];//YES：点击不保留高亮
        _segmented.selectedSegmentIndex = 0;//进入即显示0
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.titleView = self.segmented;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    label.text = @"推荐阅读";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [btn bk_addEventHandler:^(id sender) {
        [self.navigationController pushViewController:[TestViewController new] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_navigation_readerplus"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
}

- (void)clickRightItem{
    NSLog(@"...");
}


@end
