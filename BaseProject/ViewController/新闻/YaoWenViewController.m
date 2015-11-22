//
//  YaoWenViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenViewController.h"

@interface YaoWenViewController ()

@end

@implementation YaoWenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"todaynews_header_bg_day"] forBarMetrics:UIBarMetricsDefault];
    [Factory addBackItemToVCHasColor:self];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"todaynews_title_bg"]];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [UILabel new];
    label.text = @"不做了";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
