//
//  VideoTableViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoTableViewController.h"
#import "ShiPinViewModel.h"
#import "VideoCell.h"
@interface VideoTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)NSString * sid;
@property (nonatomic, strong)NSString * Title;
@property (nonatomic, strong)ShiPinViewModel * shipinVM;
@end

@implementation VideoTableViewController
- (instancetype)initWithURL:(NSString *)sid title:(NSString *)title{
    if (self = [super init]) {
        _sid = sid;
        _Title = title;
    }
    return self;
}
- (ShiPinViewModel *)shipinVM {
    if(_shipinVM == nil) {
        _shipinVM = [[ShiPinViewModel alloc] initWithSid:_sid];
    }
    return _shipinVM;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate =  self;
        _tableView.dataSource = self;
        [self.view addSubview:self.tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.Title;
    [Factory addWhiteBackItemToVC:self];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.shipinVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.shipinVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
}



#pragma mark - Table view data source
kRemoveCellSeparator
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.shipinVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.title.text = [self.shipinVM titleURLForRow:indexPath.section];
    cell.detail.text = [self.shipinVM detailURLForRow:indexPath.section];
    cell.time.text = [self.shipinVM lengthURLForRow:indexPath.section];
    cell.playCount.text = [self.shipinVM playCountURLForRow:indexPath.section];
    [cell.shareBtn setBackgroundImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    cell.replyCount.text = [self.shipinVM replyCountURLForRow:indexPath.section];
    [cell.videoBG setBackgroundImageForState:0 withURL:[self.shipinVM imageURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"video_cell_content_bg"]];
    cell.videoURL = [self.shipinVM vedioURLForRow:indexPath.section];
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