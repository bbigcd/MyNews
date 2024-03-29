//
//  NewsHtmlViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsHtmlViewController.h"
#import "NewsDetailModel.h"
#import "NewsDetailNetManager.h"
#import "NewsViewModel.h"
#import "NewsReplyViewController.h"

@interface NewsHtmlViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView * webView;
@property (nonatomic, strong)NewsDetailDataModel * detailModel;
@property (nonatomic, strong)NSMutableArray * replys;
@end

@implementation NewsHtmlViewController
- (id)initWithDocid:(NSString *)docid boardid:(NSString *)boardid replyCount:(NSInteger)reply{
    if (self = [super init]) {
        self.docid = docid;
        self.replyCount = reply;
        self.boardid = boardid;
    }
    return self;
}


- (NSMutableArray *)replys {
    if(_replys == nil) {
        _replys = [[NSMutableArray alloc] init];
    }
    return _replys;
}

//http://3g.163.com/ntes/15/1120/21/B8T6A8KN00963VRO.html
//http://c.m.163.com/nc/article/54GI0096|82574/full.html
//MVC模式
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        [self.view addSubview:self.webView];
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/%@/full.html",self.docid];
        [NewsDetailNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
            self.detailModel = [NewsDetailDataModel detailWithDict:responseObj[self.docid]];
            [self showInWebView];
        }];
        UIButton *replyCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [replyCountBtn bk_addEventHandler:^(id sender) {
            NewsReplyViewController *vc = [[NewsReplyViewController alloc]initWithType:@"html" docid:self.docid boardid:self.boardid];
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        replyCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        replyCountBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [replyCountBtn.titleLabel sizeToFit];
        if (self.replyCount <= 10) {
            replyCountBtn.frame = CGRectMake(0, 0, 57, 45);
        }else if (self.replyCount < 100 && self.replyCount >= 10){
            replyCountBtn.frame = CGRectMake(0, 0, 66, 45);
        }else if (self.replyCount <1000 && self.replyCount>100) {
            replyCountBtn.frame = CGRectMake(0, 0, 75, 45);
        }else if (self.replyCount >100000){
            replyCountBtn.frame = CGRectMake(0, 0, 94, 45);
        }else{
            replyCountBtn.frame = CGRectMake(0, 0, 84, 45);
        }
        NSString *replyCount = nil;
        if (self.replyCount>=10000) {
            replyCount = [NSString stringWithFormat:@" %.1lf万跟帖",(double)(self.replyCount/1000)/10];
        }else{
            replyCount = [NSString stringWithFormat:@" %ld跟帖",self.replyCount];
        }
        [replyCountBtn setTitle:replyCount forState:UIControlStateNormal];
        [replyCountBtn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky"] forState:UIControlStateNormal];
        [replyCountBtn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky_selected"] forState:UIControlStateSelected];
        UIBarButtonItem *memuseItem = [[UIBarButtonItem alloc]initWithCustomView:replyCountBtn];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        spaceItem.width = -15;
        self.navigationItem.rightBarButtonItems = @[spaceItem,memuseItem];
    }
    return _webView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:kBGForAllVC];
    [Factory addBackItemToVCHasColor:self];//改变返回按钮的外观
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.webView reload];
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];//旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self hideProgress];
}
#pragma mark - ******************** 拼接html语言 ******************
- (void)showInWebView
{
    NSMutableString *html = [NSMutableString string];
    [html appendString:@"<html>"];
    [html appendString:@"<head>"];
    //对HTML进行约束
    [html appendFormat:@"<link rel=\"stylesheet\" href=\"%@\">",[[NSBundle mainBundle] URLForResource:@"CDDetails.css" withExtension:nil]];
    [html appendString:@"</head>"];
    
    [html appendString:@"<body>"];
    //加载HTML的内容
    [html appendString:[self touchBody]];

    [html appendString:@"</body>"];
    
    [html appendString:@"</html>"];
    [self.webView loadHTMLString:html baseURL:nil];
}

- (NSString *)touchBody
{
    NSMutableString *body = [NSMutableString string];
    [body appendFormat:@"<div class=\"title\">%@</div>",self.detailModel.title];
    [body appendFormat:@"<div class=\"time\">%@</div>",self.detailModel.ptime];
    if (self.detailModel.body != nil) {
        [body appendString:self.detailModel.body];
    }
    // 遍历img
    for (NewsDetailDataImgModel *detailImgModel in self.detailModel.img) {
        NSMutableString *imgHtml = [NSMutableString string];
        
        // 设置img的div
        [imgHtml appendString:@"<div class=\"img-parent\">"];
        
        // 数组存放被切割的像素
        NSArray *pixel = [detailImgModel.pixel componentsSeparatedByString:@"*"];
        CGFloat width = [[pixel firstObject]floatValue];
        CGFloat height = [[pixel lastObject]floatValue];
        // 判断是否超过最大宽度
        CGFloat maxWidth = kWindowW * 0.96;
        if (width > maxWidth) {
            height = maxWidth / width * height;
            width = maxWidth;
        }
        
        NSString *onload = @"this.onclick = function() {"
        "  window.location.href = 'sx:src=' +this.src;"
        "};";
        [imgHtml appendFormat:@"<img onload=\"%@\" width=\"%f\" height=\"%f\" src=\"%@\">",onload,width,height,detailImgModel.src];
        // 结束标记
        [imgHtml appendString:@"</div>"];
        // 替换标记
        [body replaceOccurrencesOfString:detailImgModel.ref withString:imgHtml options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    }
    return body;
}
#pragma mark - ******************** 将发出通知时调用 *******************
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //拼接HTML内的图片地址
    NSString *url = request.URL.absoluteString;
    NSRange range = [url rangeOfString:@"sx:src="];
    if (range.location != NSNotFound) {
        NSInteger begin = range.location + range.length;
        NSString *src = [url substringFromIndex:begin];
        [self savePictureToAlbum:src];
        return NO;
    }
    return YES;
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
