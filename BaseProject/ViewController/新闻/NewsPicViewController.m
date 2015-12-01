//
//  NewsPicViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsPicViewController.h"
#import "NewsReplyViewController.h"
#import "NewsPhotoViewModel.h"
#import "CDImageView.h"
@interface NewsPicViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView * photoScrollView;
@property (nonatomic, strong)UIView * bottomView;
@property (nonatomic, strong)UILabel * titleLb;
@property (nonatomic, strong)UIButton * backbtn;
@property (nonatomic, strong)UILabel * countLb;
@property (nonatomic, strong)UITextView * contentText;
@property (nonatomic, strong)NSString * photosetID;
@property (nonatomic)NSInteger replyCount;
@property (nonatomic, strong)NewsPhotoViewModel * photoVM;
@end

@implementation NewsPicViewController
#pragma mark  ****---------初始化----------*****
- (id)initWithPhotosetID:(NSString *)photosetID replyCount:(NSInteger)reply{
    if (self = [super init]) {
        self.photosetID = photosetID;
        self.replyCount = reply;
    }
    return self;
}
#pragma mark  ****--------懒加载----------*****
- (NewsPhotoViewModel *)photoVM {
    if(_photoVM == nil) {
        // 取出关键字 54GI 0096|3333|3333|82934
        NSString *one  = self.photosetID;
        NSString *two = [one substringFromIndex:4];
        NSArray *three = [two componentsSeparatedByString:@"|"];
        _photoVM = [[NewsPhotoViewModel alloc] initWithPhotosetID:three.firstObject Last:three.lastObject];
    }
    return _photoVM;
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
        NewsReplyViewController *vc = [[NewsReplyViewController alloc]initWithType:@"pic" docid:nil boardid:nil];
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
#pragma mark  ****---------图片滚动视图浏览----------*****
- (UIScrollView *)photoScrollView {
    if(_photoScrollView == nil) {
        _photoScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH-184)];
        NSInteger count = [self.photoVM.photoCount integerValue];
        _photoScrollView.backgroundColor = [UIColor blackColor];
        _photoScrollView.delegate = self;
        [self.view addSubview:_photoScrollView];
        _photoScrollView.showsHorizontalScrollIndicator = NO;//水平滚动条
//        _photoScrollView.showsVerticalScrollIndicator = NO;//垂直滚动
        _photoScrollView.pagingEnabled = YES;
        //竖直方向不想滚动则可以设置为0
        self.photoScrollView.contentSize = CGSizeMake(kWindowW * count, 0);
        
    }
    return _photoScrollView;
}
/** 第一次进来页面imgView */
- (void)setImageViewWithModel{
    UIImageView *photoImgView = [[UIImageView alloc]init];
    photoImgView.backgroundColor = [UIColor blackColor];
    CGRect frame = photoImgView.frame;
    frame.size = self.photoScrollView.frame.size;
    frame.origin.x = 0;
    photoImgView.frame = frame;
    // 图片的显示格式为合适大小
    photoImgView.contentMode= UIViewContentModeCenter;
    photoImgView.contentMode= UIViewContentModeScaleAspectFit;
    [self.photoScrollView addSubview:photoImgView];
    [self setImgWithIndex:0 imageView:photoImgView];
}
/** 懒加载添加图片！公有的设置图片方法 */
- (void)setImgWithIndex:(int)i imageView:(UIImageView *)photoImgView
{
    NSURL *purl = [NSURL URLWithString:[self.photoVM imgurlInEachPhotoForRow:i]];
    
    // 如果这个相框里还没有照片才添加
    if (photoImgView.image == nil) {
        [photoImgView setImageWithURL:purl placeholderImage:[UIImage imageNamed:@"photoview_image_default_hd"]];
    }
    
}
/** 滚动完毕时调用 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = self.photoScrollView.contentOffset.x / self.photoScrollView.frame.size.width;

    // 添加文字
    NSString *countNum = [NSString stringWithFormat:@"%d/%@",index+1,self.photoVM.photoCount];
    self.countLb.text = countNum;
    
    // 添加内容
    self.contentText.text = [NSString stringWithFormat:@"%@",[self.photoVM descInEachPhotoForRow:index]];
    
    
    // 添加图片
    UIImageView *photoImgView = [[UIImageView alloc]init];
    photoImgView.backgroundColor = [UIColor blackColor];
    CGRect frame = photoImgView.frame;
    frame.size.height = self.photoScrollView.frame.size.height;
    frame.size.width = self.photoScrollView.frame.size.width;
    frame.origin.y = 0;
    frame.origin.x = index * self.photoScrollView.frame.size.width;
    photoImgView.frame = frame;
    photoImgView.contentMode= UIViewContentModeCenter;
    photoImgView.contentMode= UIViewContentModeScaleAspectFit;
    [self.photoScrollView addSubview:photoImgView];
    [self setImgWithIndex:index imageView:photoImgView];
}
#pragma mark  ****---------底部详情text----------*****
- (UITextView *)contentText {
    if(_contentText == nil) {
        _contentText = [[UITextView alloc] init];
        _contentText.font = [UIFont systemFontOfSize:12];
        _contentText.backgroundColor = [UIColor clearColor];
        _contentText.textColor = [UIColor whiteColor];
        _contentText.text = [NSString stringWithFormat:@"%@",[self.photoVM descInEachPhotoForRow:0]];
        _contentText.editable = NO;
        _contentText.showsHorizontalScrollIndicator = NO;
        _contentText.showsVerticalScrollIndicator = NO;
        _contentText.textAlignment = UIViewContentModeTopLeft;
        [self.view addSubview:self.contentText];
        [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.bottomView.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(43);
        }];
    }
    return _contentText;
}
#pragma mark  ****---------图片标题----------*****
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.backgroundColor = [UIColor clearColor];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.text = [NSString stringWithFormat:@"%@",self.photoVM.title];
        [self.view addSubview:self.titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentText.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.width.mas_equalTo(280);
        }];
    }
    return _titleLb;
}
#pragma mark  ****---------翻页数----------*****
- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        _countLb.font = [UIFont systemFontOfSize:16];
        _countLb.backgroundColor = [UIColor clearColor];
        _countLb.textAlignment = UIControlContentHorizontalAlignmentRight;
        _countLb.textColor = [UIColor whiteColor];
        _countLb.text = [NSString stringWithFormat:@"1/%@",self.photoVM.photoCount];
        [self.view addSubview:self.countLb];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentText.mas_top).mas_equalTo(0);
            make.right.mas_equalTo(-5);
            make.width.mas_equalTo(60);
        }];
    }
    return _countLb;
}
#pragma mark  ****---------底部视图----------*****
- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(49);
        }];
        UIImageView *starIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_star"]];
        [_bottomView addSubview:starIV];
        [starIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.mas_equalTo(_bottomView);
            make.right.mas_equalTo(-5);
        }];
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setImage:[UIImage imageNamed:@"weather_share"] forState:UIControlStateNormal];
        [shareBtn setImage:[UIImage imageNamed:@"weather_share_highlight"] forState:UIControlStateSelected];
        [_bottomView addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(45, 44));
            make.centerY.mas_equalTo(_bottomView);
            make.right.mas_equalTo(starIV.mas_left).mas_equalTo(-8);
        }];
        [shareBtn bk_addEventHandler:^(id sender) {
            [self showErrorMsg:@"记得写分享"];
        } forControlEvents:UIControlEventTouchUpInside];
        UIImageView *moreIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_navigation_more"]];
        [_bottomView addSubview:moreIV];
        [moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.mas_equalTo(_bottomView);
            make.right.mas_equalTo(shareBtn.mas_left).mas_equalTo(-8);
        }];
    }
    return _bottomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    //调用VM层获取数据
    [self.photoVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self backBtn];
        [self replyCountBtn];
        [self photoScrollView];
        [self setImageViewWithModel];
        [self bottomView];
        [self contentText];
        [self titleLb];
        [self countLb];
    }];
    //添加手势  长按滚动视图保存当前视图的图片到本地 双击放大图片
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
    tapGR.numberOfTapsRequired = 2;
    //与视图绑定
    [self.view addGestureRecognizer:longTap];
    [self.view addGestureRecognizer:tapGR];
}
- (void)longTap:(UILongPressGestureRecognizer *)gr{
//    [self savePictureToAlbum:[self.photoVM imgurlInEachPhotoForRow:0]];
    [self showErrorMsg:@"长按保存图片"];
}
- (void)doubleTap:(UITapGestureRecognizer *)gr{
    [self showErrorMsg:@"双击放大图片"];
}
#pragma mark - ******************** 保存到相册方法 **********************
- (void)savePictureToAlbum:(NSString *)src
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要保存到相册吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        NSURLCache *cache =[NSURLCache sharedURLCache];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:src]];
        NSData *imgData = [cache cachedResponseForRequest:request].data;
        UIImage *image = [UIImage imageWithData:imgData];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
    }]];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    self.tabBarController.tabBar.hidden = YES;
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
