//
//  YaoWenViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "YaoWenViewController.h"
#import "YaoWenCell.h"
#import "FirstYaoWenCell.h"
#import "YaoWenViewModel.h"
#import "NewsHtmlViewController.h"
@interface YaoWenViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)YaoWenViewModel * yaowenVM;
@property (nonatomic, strong)UIView * headView;
@property (nonatomic)NSInteger headViewY;

@end

@implementation YaoWenViewController
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[YaoWenCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[FirstYaoWenCell class] forCellReuseIdentifier:@"FCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(106);
        }];
    }
    return _tableView;
}
- (YaoWenViewModel *)yaowenVM {
    if(_yaowenVM == nil) {
        _yaowenVM = [[YaoWenViewModel alloc] init];
    }
    return _yaowenVM;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}
#pragma mark  ****---------头部视图----------*****
- (UIView *)headView {
    if(_headView == nil) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, _headViewY)];
        UIImageView *naviView = [[UIImageView alloc]init];
        [naviView setImage:[UIImage imageNamed:@"todaynews_header_bg_day"]];
        [_headView addSubview:naviView];
        [naviView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        /**   顶部返回按钮 */
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"night_icon_back"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"night_icon_back_highlighted"] forState:UIControlStateSelected];
        [_headView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(7);
            make.top.mas_equalTo(22);
            make.size.mas_equalTo(CGSizeMake(54, 44));
        }];
        [btn bk_addEventHandler:^(id sender) {
            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            [self.navigationController.navigationBar setBarTintColor:kNavibackgroundColor];
            self.tabBarController.tabBar.hidden = NO;
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"todaynews_title_bg"]];
        [naviView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(45);
        }];
        UILabel *label = [UILabel new];
        label.text = @"—— 聚焦今日时事 浓缩新闻精华 ——";
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        [naviView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-23);
        }];
        return _headView;
        
    }
    return _headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景色
    [self.view setBackgroundColor:kBGForAllVC];
    self.headViewY = 130;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.yaowenVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer resetNoMoreData];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.yaowenVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            [self.tableView reloadData];
            [self showErrorMsg:@"今天的要闻就这么多了%>_<%"];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    [self.view addSubview:[self headView]];
//    NSLog(@"%@",NSStringFromCGRect(self.headView.frame));
    //创建拖动手势
//    UIPanGestureRecognizer *panGR= [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];

    //与视图绑定
//    [self.tableView addGestureRecognizer:panGR];
}
#pragma mark  ****---------手势----------*****
- (void)pan:(UIPanGestureRecognizer *)gr{
    CGPoint translation = [gr translationInView:self.tableView];
    CGPoint center = self.headView.center;
    self.headViewY += translation.y;
    center.y = self.headViewY;
    self.headView.center = center;
    [gr setTranslation:CGPointZero inView:self.tableView];
}
#pragma mark ---- Table View Data Source
kRemoveCellSeparator//去左缝隙
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.yaowenVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    /*UITableView中的cell可以有很多，一般会通过重用cell来达到节省内存的目的:通过为每个cell指定一个重用标识符(reuseIdentifier),即指定了单元格的种类,当cell滚出屏幕时,会将滚出屏幕的单元格放入重用的queue中，当某个未在屏幕上的单元格要显示的时候，就从这个queue中取出单元格进行重用。
     
     但对于多变的自定义cell，有时这种重用机制会出错。比如，当一个cell含有一个UITextField的子类并被放在重用queue中以待重用，这时如果一个未包含任何子视图的cell要显示在屏幕上，就会取出并使用这个重用的cell显示在无任何子视图的cell中，这时候就会出错。
     
     解决方法：
     
     方法 将获得cell的方法从 - (UITableViewCell*)dequeueReusableCellWithIdentifier:(NSString*)identifier
                        换为 -(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
     
     重用机制调用的就是dequeueReusableCellWithIdentifier这个方法，方法的意思就是“出列可重用的cell”，因而只要将它换为cellForRowAtIndexPath（只从要更新的cell的那一行取出cell），就可以不使用重用机制，因而问题就可以得到解决，虽然可能会浪费一些空间。*/
//    YaoWenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //根据indexpath.row不同来创建不同的cell.由于监听indexpath改变而改变布局会由严重BUG,所有重写了个自定义cell
    YaoWenCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    FirstYaoWenCell *cell1 = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil||cell1==nil) {
        cell1 = [[FirstYaoWenCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FCell"];
        cell = [[YaoWenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (indexPath.row==0) {
        [cell1.iconIV.imageView setImageWithURL:[self.yaowenVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
        cell1.numberLb.text = @(indexPath.row+1).stringValue;
        cell1.titleLb.text = [self.yaowenVM titleForRow:indexPath.row];
        cell1.longTitleLb.text = [self.yaowenVM digestForRow:indexPath.row];
        cell1.clicksNumLb.text = [self.yaowenVM replyCountForRow:indexPath.row];
        return cell1;
    }else{
        [cell.iconIV.imageView setImageWithURL:[self.yaowenVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"video_recommend_cell_bg"]];
        if (indexPath.row<3&&indexPath.row>0) {
            cell.numberLb.text = @(indexPath.row+1).stringValue;
        }
        cell.titleLb.text = [self.yaowenVM titleForRow:indexPath.row];
        cell.longTitleLb.text = [self.yaowenVM digestForRow:indexPath.row];
        cell.clicksNumLb.text = [self.yaowenVM replyCountForRow:indexPath.row];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //第一行高和其他行高不一致
    if (indexPath.row == 0) {
        return 266;
    }else{
        return 91;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.yaowenVM isHtmlForRow:indexPath.row]) {
        NewsHtmlViewController *vc = [[NewsHtmlViewController alloc]initWithURL:[self.yaowenVM docidForRow:indexPath.row] replyCount:[self.yaowenVM replyCountDetailForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
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
