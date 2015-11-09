//
//  NewsListViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsViewModel.h"
#import "NewsListCell.h"
#import "iCarousel.h"//3D切换效果
@interface NewsListViewController ()
@property (nonatomic, strong)NewsViewModel * newsVM;
@end

@implementation NewsListViewController
- (NewsViewModel *)newsVM {
    if(_newsVM == nil) {
        _newsVM = [[NewsViewModel alloc] initWithType:self.infoType.integerValue];
        NSLog(@"%ld",self.infoType.integerValue);
    }
    return _newsVM;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:kBGForAllVC];
    [self.tableView registerClass:[NewsListCell class] forCellReuseIdentifier:@"ListCell"];
    //    [self.tableView registerClass:[NewsListCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM refreshDataCompletionHandle:^(NSError *error) {
//            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
//            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}
#pragma mark - table view data source
/** 去左边缘缝隙 */
kRemoveCellSeparator
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsVM.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.newsVM iconURLForRowInHeadLine:indexPath.row] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
    cell.titleLb.text = [self.newsVM titleForRowInHeadLine:indexPath.row];

    cell.longTitleLb.text = [self.newsVM digestForRowInHeadLine:indexPath.row];
    cell.clicksNumLb.text = [self.newsVM replyCountForRowInHeadLine:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

