//
//  NewsReplyViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyViewController.h"
#import "NewsReplyCell.h"
#import "NewsReplyViewModel.h"
#import "NewsReplyHeader.h"
@interface NewsReplyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)NSString * type;
@property (nonatomic, strong)NSString * boardid;
@property (nonatomic, strong)NSString * docid;
@property (nonatomic, strong)NewsReplyViewModel * newsReplyVM;
@end

@implementation NewsReplyViewController
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setTableHeaderView:[self headView]];
        //给个猜测的行高，提高性能   让cell可以自行计算应该有的高度
        _tableView.estimatedRowHeight = 130.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [_tableView registerClass:[NewsReplyCell class] forCellReuseIdentifier:@"ReplyCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(64);
        }];
    }
    return _tableView;
}

- (id)initWithType:(NSString *)type docid:(NSString *)docid boardid:(NSString *)boardid{
    if (self = [super init]) {
        self.type = type;
        self.docid = docid;
        self.boardid = boardid;
    }
    return self;
}
- (NewsReplyViewModel *)newsReplyVM {
    if(_newsReplyVM == nil) {
        _newsReplyVM = [[NewsReplyViewModel alloc] initWithBoardIDAndDocid:self.boardid docid:self.docid];
    }
    return _newsReplyVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    if ([self.type isEqualToString:@"pic"]) {
        [Factory addBackItemToVCHasColor:self];
    }else{
        [Factory addBackItemToVC:self];
    }
    //提前把评论数据加载出来
    [self.newsReplyVM getDataFromNetCompleteHandle:^(NSError *error) {
//        NSLog(@"name:%@",[self.newsReplyVM nameForRow:0]);
        
        
    }];
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}
#pragma mark ----------table view data source--------------
kRemoveCellSeparator
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (self.newsReplyVM.rowNumber == 0) {
//        return 1;
//    }
//    if (section == 0) {
//        return self.newsReplyVM.rowNumber;
//    }else{
//        return self.newsReplyVM.rowNumber;
//    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsReplyCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NewsReplyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReplyCell"];
    }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(NewsReplyCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    [cell.headIV setImageWithURL:[NSURL URLWithString:[self.newsReplyVM headForRow:indexPath.row]] placeholderImage:[UIImage imageNamed:@"comment_profile_default"]];
    cell.nameLabel.text = [self.newsReplyVM nameForRow:indexPath.row];
    
    cell.addressLabel.text = [self.newsReplyVM addressForRow:indexPath.row];
    NSRange rangeAddress = [[self.newsReplyVM addressForRow:indexPath.row] rangeOfString:@"&nbsp"];
    if (rangeAddress.location != NSNotFound) {
        cell.addressLabel.text = [[self.newsReplyVM addressForRow:indexPath.row] substringToIndex:rangeAddress.location];
    }
    
    cell.supposeLabel.text = [self.newsReplyVM supposeForRow:indexPath.row];
    cell.sayLabel.text = [self.newsReplyVM sayForRow:indexPath.row];
}
/** 返回一个view来当tbv的header */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [self headView];;
    }else{
        return [self headView];;
    }
//    return [self headView];
}
- (UIView *)headView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 40)];
    view.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(74, 40));
    }];
    [btn setTitle:@"热门跟帖" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky_selected"] forState:UIControlStateSelected];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
