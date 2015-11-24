//
//  NewsPicViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsPicViewController.h"
#import "NewsReplyViewController.h"
@interface NewsPicViewController ()
@property (nonatomic, strong)UIScrollView * photoScrollView;
@property (nonatomic, strong)UILabel * titleLbel;
@property (nonatomic, strong)UIButton * backbtn;
@property (nonatomic)NSInteger replyCount;
@end

@implementation NewsPicViewController
#pragma mark  ****---------初始化----------*****
- (id)initWithURL:(NSString *)url replyCount:(NSInteger)reply{
    if (self = [super init]) {
        self.url = url;
        self.replyCount = reply;
    }
    return self;
}
#pragma mark  ****---------顶部返回按钮----------*****
- (void)backBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backbtn = btn;
    [btn setImage:[UIImage imageNamed:@"night_icon_back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"night_icon_back_highlighted"] forState:UIControlStateSelected];
    [self.view addSubview:btn];
    [self.backbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(7);
        make.top.mas_equalTo(22);
        make.size.mas_equalTo(CGSizeMake(54, 44));
    }];
    [self.backbtn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.navigationController.navigationBar setBarTintColor:kNavibackgroundColor];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.tabBarController.tabBar.hidden = NO;
    } forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark  ****---------顶部评论数----------*****
- (void)replyCountBtn{
    UIButton *replyCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [replyCountBtn bk_addEventHandler:^(id sender) {
        NewsReplyViewController *vc = [[NewsReplyViewController alloc]initWithType:@"pic"];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    replyCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    replyCountBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [replyCountBtn.titleLabel sizeToFit];
    NSString *replyCount = nil;
    if (self.replyCount>=10000) {
        replyCount = [NSString stringWithFormat:@" %.1lf万跟帖",(double)(self.replyCount/1000)/10];
    }else{
        replyCount = [NSString stringWithFormat:@" %ld跟帖",self.replyCount];
    }
    [replyCountBtn setTitle:replyCount forState:UIControlStateNormal];
    [replyCountBtn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky"] forState:UIControlStateNormal];
    [replyCountBtn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky_selected"] forState:UIControlStateSelected];
    [self.view addSubview:replyCountBtn];
    [replyCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-9);
        make.centerY.mas_equalTo(self.backbtn);
        if (self.replyCount < 10){
            make.size.mas_equalTo(CGSizeMake(57, 45));
        }else if (self.replyCount <100 && self.replyCount>= 10) {
            make.size.mas_equalTo(CGSizeMake(66, 45));
        }else if (self.replyCount <1000 && self.replyCount>100) {
            make.size.mas_equalTo(CGSizeMake(75, 45));
        }else{
            make.size.mas_equalTo(CGSizeMake(84, 45));
        }
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self backBtn];
    [self replyCountBtn];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden = YES;
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
