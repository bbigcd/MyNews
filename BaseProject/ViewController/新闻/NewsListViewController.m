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
    }
    return _newsVM;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
