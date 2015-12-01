//
//  NewsHtmlViewController.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsHtmlViewController : UIViewController
- (id)initWithDocid:(NSString *)docid boardid:(NSString *)boardid replyCount:(NSInteger)reply ;
@property (nonatomic, strong)NSString * docid;
@property (nonatomic, strong)NSString * boardid;
@property (nonatomic)NSInteger replyCount;
@end
