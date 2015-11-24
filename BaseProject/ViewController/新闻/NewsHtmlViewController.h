//
//  NewsHtmlViewController.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsHtmlViewController : UIViewController
- (id)initWithURL:(NSString *)url replyCount:(NSInteger)reply;
@property (nonatomic, strong)NSString * url;
@end
