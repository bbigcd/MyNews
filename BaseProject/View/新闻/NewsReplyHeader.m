//
//  NewsReplyHeader.m
//  BaseProject
//
//  Created by apple-jd03 on 15/12/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsReplyHeader.h"

@implementation NewsReplyHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */

/** 类方法快速返回热门跟帖的view */
+ (instancetype)replyViewFirst{
    NSArray *arr = [NSArray new];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 40)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(84, 40));
    }];
    [btn setTitle:@"热门跟帖" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky_selected"] forState:UIControlStateSelected];
     [arr arrayByAddingObject:view];
    return view;
 }
/** 类方法快速返回最新跟帖的view */
+ (instancetype)replyViewLast{
    NSArray *arr = [NSArray new];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 40)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(84, 40));
    }];
    [btn setTitle:@"最新跟帖" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"contentview_commentbacky_selected"] forState:UIControlStateSelected];
    [arr arrayByAddingObject:view];
    return [arr lastObject];
}

@end
