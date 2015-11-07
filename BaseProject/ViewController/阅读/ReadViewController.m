//
//  ReadViewController.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReadViewController.h"

@implementation ReadViewController
- (id)initTitleName:(NSString *)name{
    if (self = [super init]) {
        self.title = name;
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabbar_icon_reader_normal"]];
        [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_icon_reader_highlight"]];
        // tab bar 被点击的背景图默认颜色为蓝色填充，如需显示背景图本身颜色需添加下方方法
        UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"阅读";
    
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
