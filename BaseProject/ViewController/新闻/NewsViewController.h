//
//  NewsViewController.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>
/*! 使用第三方框架WMPageController来添加新闻页面的导航栏,需要改掉继承类 */
@interface NewsViewController : UIViewController
/** 初始化 */
- (id)initTitleName:(NSString *)name;
+ (UINavigationController *)standarTuWanNavi;
@end
