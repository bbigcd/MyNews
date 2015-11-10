//
//  MyViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MyViewController.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@end
@implementation MyViewController
- (id)initTitleName:(NSString *)name{
    if (self = [super init]) {
        self.tabBarItem.title = name;
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_me_normal"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_me_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
    }
    return self;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(-20);
        }];
    }
    return _tableView;
}
- (UIView *)headerView{
    //头部视图 origin无效，宽度无效，肯定与table同宽
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 280)];
    headView.backgroundColor = kNavibackgroundColor;
    UIButton *buttom = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttom setTitle:@"设置" forState:UIControlStateNormal];
    buttom.titleLabel.font = [UIFont systemFontOfSize:15];
    buttom.tintColor = [UIColor whiteColor];
    [headView addSubview:buttom];
    [buttom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
    }];
    
    //推出设置控制器
    [buttom bk_addEventHandler:^(id sender) {
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
//        [Factory addBackItemToVC:vc];//添加返回按钮
    } forControlEvents:UIControlEventTouchUpInside];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(220, 220, 220);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(86);
    }];
    
    //添加头像
//    UIImageView *headImageView = [UIImageView alloc]initWithImage:<#(nullable UIImage *)#> highlightedImage:<#(nullable UIImage *)#>
    //有网络数据用上面的
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_defaulthead"]];
    headImageView.layer.cornerRadius = 75/2;
    [headView addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.top.mas_equalTo(30);
    }];
    //添加登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    [headView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(headImageView.mas_bottom).mas_equalTo(10);
    }];
    //点击登录
    [loginBtn bk_addEventHandler:^(id sender) {
        NSLog(@"登录按钮被点击了");
    } forControlEvents:UIControlEventTouchUpInside];
    
    //添加黄色文字=_=|
    UILabel *yellowLb = [UILabel new];
    yellowLb.text = @"赢金币抢大礼!";
    yellowLb.font = [UIFont systemFontOfSize:16];
    yellowLb.textColor = kRGBColor(238, 211, 97);
    [headView addSubview:yellowLb];
    [yellowLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(loginBtn.mas_bottom).mas_equalTo(5);
    }];
    
    
    //添加四个UIView，再在每一UIView里添加一个等宽，等高的Buttom
    UIView *view1 = [UIView new];
    UIView *view2 = [UIView new];
    UIView *view3 = [UIView new];
    UIView *view4 = [UIView new];
    [bottomView addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:view2];
    view2.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:view3];
    view3.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:view4];
    view4.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kWindowW-3)/4, 85));
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view1.mas_right).mas_equalTo(1);
        make.bottom.mas_equalTo(-1);
        make.size.mas_equalTo(view1);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view2.mas_right).mas_equalTo(1);
        make.bottom.mas_equalTo(-1);
        make.size.mas_equalTo(view1);
    }];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view3.mas_right).mas_equalTo(1);
        make.bottom.mas_equalTo(-1);
        make.size.mas_equalTo(view1);
    }];
    
    //阅读  可以把图片和label加载按钮层上
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor clearColor];
    [view1 addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [btn1 bk_addEventHandler:^(id sender) {
//        NSLog(@"阅读按钮被点击");
    } forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_read_icon"]];
    [btn1 addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(22);
        make.size.mas_equalTo(CGSizeMake(40, 18));
    }];
    UILabel *label1 = [UILabel new];
    label1.text = @"阅读";
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor lightGrayColor];
    [view1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-14);
    }];
    
    
    
    //收藏
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor clearColor];
    [view2 addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_favor_icon"]];
    [view2 addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(18);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    UILabel *label2 = [UILabel new];
    label2.text = @"收藏";
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor lightGrayColor];
    [view2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-14);
    }];
    
    
    //跟帖
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor clearColor];
    [view3 addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_comment_icon"]];
    [view3 addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(22, 23));
    }];
    UILabel *label3 = [UILabel new];
    label3.text = @"跟帖";
    label3.font = [UIFont systemFontOfSize:15];
    label3.textColor = [UIColor lightGrayColor];
    [view3 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-14);
    }];
    
    //金币
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.backgroundColor = [UIColor clearColor];
    [view4 addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    UIImageView *imageView4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_coin_icon"]];
    [view4 addSubview:imageView4];
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(29, 22));
    }];
    UILabel *label4 = [UILabel new];
    label4.text = @"金币";
    label4.font = [UIFont systemFontOfSize:15];
    label4.textColor = [UIColor lightGrayColor];
    [view4 addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-14);
    }];
    
    
    return headView;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.tableHeaderView = [self headerView];
    [self.tableView reloadData];
}

#pragma mark ---- Table View Data Source
kRemoveCellSeparator//去左缝隙
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 3;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"我的消息";
            cell.imageView.image = [UIImage imageNamed:@"user_set_icon_message"];
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"金币商城";
                cell.imageView.image = [UIImage imageNamed:@"user_set_icon_mall"];
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"金币任务";
                cell.imageView.image = [UIImage imageNamed:@"user_set_icon_mission"];
            }else{
                cell.textLabel.text = @"我的钱包";
                cell.imageView.image = [UIImage imageNamed:@"user_set_icon_wallet"];
            }
            break;
        case 2:
            cell.textLabel.text = @"我的邮箱";
            cell.imageView.image = [UIImage imageNamed:@"user_set_icon_mail"];
            break;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
