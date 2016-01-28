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
#import "NewsImageCell.h"
#import "HotNewsCell.h"
#import "HotNewsImageCell.h"
#import "iCarousel.h"//3D切换效果
#import "NewsHtmlViewController.h"
#import "NewsPicViewController.h"
#import "SpecialViewController.h"
@interface NewsListViewController ()<iCarouselDelegate,iCarouselDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong)NewsViewModel * newsVM;
@end

@implementation NewsListViewController
{//添加成员变量，因为不需要懒加载，所以不需要属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    UIImageView *_imageView;
    NSTimer *_timer;
}
- (UIView *)headView{
    [_timer invalidate];
    if (self.newsVM.type == 6) return nil;
    if (!self.newsVM.isHashead) return nil;
    //头部视图
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*540)];
    //添加底部视图
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
//    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_tag_photo"]];
//    [bottomView addSubview:_imageView];
//    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.centerY.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(18, 18));
//    }];
    _titleLb = [UILabel new];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_imageView.mas_right).mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(242);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = self.newsVM.indexPicNumber;
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-2);
//        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    if (self.newsVM.type == 2) {
        _titleLb.text = [self.newsVM titleForRowInHotHead];
    }else{
        _titleLb.text = [self.newsVM titleForRowInAds:0];//初始值
    }
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled  = YES;
    _ic.scrollSpeed = 1;//降低滚动速度
    
    //如果只有一张图，则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图 则不可以滚动
    _ic.scrollEnabled = self.newsVM.indexPicNumber != 1;

    
    if (self.newsVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    
    return headView;
}
#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.newsVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    if (self.newsVM.type == 2) {
        [imageView setImageWithURL:[self.newsVM imgsrcForHotHead] placeholderImage:[UIImage imageNamed:@"recommend_image_bg"]];
    }else{
        [imageView setImageWithURL:[self.newsVM iconURLForRowInAds:index] placeholderImage:[UIImage imageNamed:@"recommend_image_bg"]];
    }
    return view;
}
/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/** 监听当前滚动到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    //    NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text = [self.newsVM titleForRowInAds:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (NewsViewModel *)newsVM {
    if(_newsVM == nil) {
        _newsVM = [[NewsViewModel alloc] initWithType:self.infoType.integerValue];
    }
    return _newsVM;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = kNavibackgroundColor;
    [self.view setBackgroundColor:kBGForAllVC];
    [self.tableView registerClass:[HotNewsCell class] forCellReuseIdentifier:@"HotCell"];
    [self.tableView registerClass:[HotNewsImageCell class] forCellReuseIdentifier:@"HotImageCell"];
    [self.tableView registerClass:[NewsImageCell class] forCellReuseIdentifier:@"ImageCell"];
    [self.tableView registerClass:[NewsListCell class] forCellReuseIdentifier:@"ListCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headView];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.newsVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headView];
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
        return self.newsVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.newsVM.type == 2) {
        if ([self.newsVM containImages:indexPath.row+1]) {
            HotNewsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotImageCell"];
            cell.titleLb.text = [self.newsVM titleForRow:indexPath.row+1];
            cell.longTitleLb.text = [self.newsVM sourceForRow:indexPath.row+1];
            cell.clicksNumLb.text = [self.newsVM replyCountForRow:indexPath.row+1];
            [cell.iconIV0.imageView setImageWithURL:[self.newsVM iconURLForRow:indexPath.row+1] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            [cell.iconIV1.imageView setImageWithURL:[self.newsVM iconsURLSForRow:indexPath.row+1][0] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            [cell.iconIV2.imageView setImageWithURL:[self.newsVM iconsURLSForRow:indexPath.row+1][1] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            return cell;
        }
        HotNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell" forIndexPath:indexPath];
        [cell.iconIV.imageView setImageWithURL:[self.newsVM iconURLForRow:indexPath.row+1] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
        cell.hotIV.image = [UIImage imageNamed:@"news_fire"];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row+1];
        cell.longTitleLb.text = [self.newsVM sourceForRow:indexPath.row+1];
        cell.clicksNumLb.text = [self.newsVM replyCountForRow:indexPath.row+1];
        return cell;
    }else{
        if ([self.newsVM containImages:indexPath.row]) {
            NewsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
            cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
            cell.clicksNumLb.text = [self.newsVM replyCountForRow:indexPath.row];
            [cell.iconIV0.imageView setImageWithURL:[self.newsVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            [cell.iconIV1.imageView setImageWithURL:[self.newsVM iconsURLSForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            [cell.iconIV2.imageView setImageWithURL:[self.newsVM iconsURLSForRow:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
            return cell;
        }
//        NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
        NewsListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[NewsListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListCell"];
        }
        [cell.iconIV.imageView setImageWithURL:[self.newsVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
        cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
        cell.longTitleLb.text = [self.newsVM digestForRow:indexPath.row];
        if ([self.newsVM isSpecial:indexPath.row]) {
            cell.clicksNumLbHasSpecial.text = @"专题";
        }else if ([self.newsVM isVideoForRow:indexPath.row]){
            cell.clicksNumLbHasVideo.text = [self.newsVM replyCountForRow:indexPath.row];
        }else{
            cell.clicksNumLb.text = [self.newsVM replyCountForRow:indexPath.row];
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.newsVM.type==2) {
        return [self.newsVM containImages:indexPath.row+1] ? 150:97;
    }else{
        return [self.newsVM containImages:indexPath.row] ? 118:80;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.newsVM.type==2) {
        if ([self.newsVM isHtmlForRow:indexPath.row+1]||[self.newsVM isDuJiaForRow:indexPath.row+1]) {
            NewsHtmlViewController *vc = [[NewsHtmlViewController alloc]initWithDocid:[self.newsVM docidURLForRow:indexPath.row+1] boardid:[self.newsVM boardidURLForRow:indexPath.row+1] replyCount:[self.newsVM replyCountDetailForRow:indexPath.row+1]];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"该行是html");
        }
        if ([self.newsVM isPicForRow:indexPath.row+1]) {
            NewsPicViewController *vc = [[NewsPicViewController alloc]initWithPhotosetID:[self.newsVM photosetIDForRow:indexPath.row+1] replyCount:[self.newsVM replyCountDetailForRow:indexPath.row+1]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"该行是图片");
        }
        if ([self.newsVM isVideoForRow:indexPath.row+1]) {
            NSLog(@"该行是视频");
        }
        if ([self.newsVM isSpecial:indexPath.row+1]) {
            NSLog(@"该行是专题");
            SpecialViewController *vc = [[SpecialViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }else{
        if ([self.newsVM isHtmlForRow:indexPath.row]||[self.newsVM isDuJiaForRow:indexPath.row]) {
            NewsHtmlViewController *vc = [[NewsHtmlViewController alloc]initWithDocid:[self.newsVM docidURLForRow:indexPath.row] boardid:[self.newsVM boardidURLForRow:indexPath.row] replyCount:[self.newsVM replyCountDetailForRow:indexPath.row]];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"该行是html");
        }
        if ([self.newsVM isPicForRow:indexPath.row]) {
            NewsPicViewController *vc = [[NewsPicViewController alloc]initWithPhotosetID:[self.newsVM photosetIDForRow:indexPath.row] replyCount:[self.newsVM replyCountDetailForRow:indexPath.row]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"该行是图片");
        }
        if ([self.newsVM isVideoForRow:indexPath.row]) {
            NSLog(@"该行是视频");
        }
        if ([self.newsVM isSpecial:indexPath.row]) {
            NSLog(@"该行是专题");
            SpecialViewController *vc = [[SpecialViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
/** 滚动栏被选中 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.newsVM isHtmlForRowInHead:index]) {
        NSLog(@"该行是html");
    }
    if ([self.newsVM isPicForRowInHead:index]||self.newsVM.type==2) {
        NewsPicViewController *vc = [[NewsPicViewController alloc]initWithPhotosetID:[self.newsVM photosetIDInHeadForRow:index] replyCount:[self.newsVM replyCountDetailForRow:index]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"该行是图片");
    }
    if ([self.newsVM isVideoForRowInHead:index]) {
        NSLog(@"该行是视频");
    }
}
/** 手势判断*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    return YES;
}
@end

