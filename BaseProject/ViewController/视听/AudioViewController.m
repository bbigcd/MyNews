//
//  AudioViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AudioViewController.h"
#import "ListenViewController.h"
#import "VideoViewModel.h"
#import "VideoCell.h"
@interface AudioViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)UISegmentedControl * segmented;
@property (nonatomic, strong)VideoViewModel * videoVM;
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
    if (self.segmented.selectedSegmentIndex == 0) {
        if (self.segmented.selectedSegmentIndex == 1) {
            [self.view removeFromSuperview];
        }
        AudioViewController *vc1 = [[AudioViewController alloc]init];
        UINavigationController *vc = [[UINavigationController alloc]initWithRootViewController:vc1];
        [self.view addSubview:vc.view];
    }
    if (self.segmented.selectedSegmentIndex == 1) {
        if (self.segmented.selectedSegmentIndex == 0) {
            [self.view removeFromSuperview];
        }
        ListenViewController *vc2 = [[ListenViewController alloc]init];
        UINavigationController *vc = [[UINavigationController alloc]initWithRootViewController:vc2];
        [self.view addSubview:vc.view];
    }
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headView];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headView];
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
}
- (UIView *)headView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 80)];
    headView.backgroundColor = kRGBColor(240, 240, 240);
    //四个view
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor whiteColor];
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor whiteColor];
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor whiteColor];
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor whiteColor];
    [headView addSubview:view1];
    [headView addSubview:view2];
    [headView addSubview:view3];
    [headView addSubview:view4];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kWindowW-1.5)/4, 80));
        make.left.mas_equalTo(0);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kWindowW-1.5)/4, 80));
        make.left.mas_equalTo(view1.mas_right).mas_equalTo(0.5);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kWindowW-1.5)/4, 80));
        make.left.mas_equalTo(view2.mas_right).mas_equalTo(0.5);
    }];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kWindowW-1.5)/4, 80));
        make.left.mas_equalTo(view3.mas_right).mas_equalTo(0.5);
    }];
    
    
    //四个button 和label
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.layer.cornerRadius = 33/2;
    [view1 addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    [btn1 setBackgroundImageForState:0 withURL:[self.videoVM imgURLForRow:0] placeholderImage:[UIImage imageNamed:@"video_comment_bg"]];
    UILabel *label1 = [UILabel new];
    label1.text  =  [self.videoVM headTitleForRow:0];
    label1.font = [UIFont systemFontOfSize:15];
    [view1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.layer.cornerRadius = 33/2;
    [view2 addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    [btn2 setBackgroundImageForState:0 withURL:[self.videoVM imgURLForRow:1] placeholderImage:[UIImage imageNamed:@"video_comment_bg"]];
    UILabel *label2 = [UILabel new];
    label2.text  =  [self.videoVM headTitleForRow:1];
    label2.font = [UIFont systemFontOfSize:15];
    [view2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.layer.cornerRadius = 33/2;
    [view3 addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    [btn3 setBackgroundImageForState:0 withURL:[self.videoVM imgURLForRow:2] placeholderImage:[UIImage imageNamed:@"video_comment_bg"]];
    UILabel *label3 = [UILabel new];
    label3.text  =  [self.videoVM headTitleForRow:2];
    label3.font = [UIFont systemFontOfSize:15];
    [view3 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn4.layer.cornerRadius = 33/2;
    [view4 addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(33, 33));
    }];
    [btn4 setBackgroundImageForState:0 withURL:[self.videoVM imgURLForRow:3] placeholderImage:[UIImage imageNamed:@"video_comment_bg"]];
    UILabel *label4 = [UILabel new];
    label4.text  =  [self.videoVM headTitleForRow:3];
    label4.font = [UIFont systemFontOfSize:15];
    [view4 addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    
    
    return headView;
}
- (VideoViewModel *)videoVM {
    if(_videoVM == nil) {
        _videoVM = [[VideoViewModel alloc] init];
    }
    return _videoVM;
}

- (UITableView *)tableView {
	if(!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:self.tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
	}
	return _tableView;
}
#pragma mark - table view data source
kRemoveCellSeparator
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.title.text = [self.videoVM titleURLForRow:indexPath.section];
    cell.detail.text = [self.videoVM detailURLForRow:indexPath.section];
    cell.time.text = [self.videoVM lengthURLForRow:indexPath.section];
    cell.playCount.text = [self.videoVM playCountURLForRow:indexPath.section];
    [cell.shareBtn setBackgroundImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    cell.replyCount.text = [self.videoVM replyCountURLForRow:indexPath.section];
    [cell.videoBG setBackgroundImageForState:0 withURL:[self.videoVM imageURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"video_content_bg"]];
    cell.videoURL = [self.videoVM vedioURLForRow:indexPath.section];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//设置section头部高度1像素， 高度最小是1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
//设置secion脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 292;
}


@end
