//
//  Factory.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Factory : UIView
/*! 向某个控制器，添加返回按钮 */
+ (void)addBackItemToVC:(UIViewController *)vc;
/*! 向某个控制器，添加返回按钮 */
+ (void)addBackItemToVCHasColor:(UIViewController *)vc;
/*! 向某个控制器，添加白色返回按钮 */
+ (void)addWhiteBackItemToVC:(UIViewController *)vc;

@end
