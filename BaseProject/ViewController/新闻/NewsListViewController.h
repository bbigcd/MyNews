//
//  NewsListViewController.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UITableViewController
/*! 接受外部传参数，决定当前控制器显示哪种类型的信息 */
@property (nonatomic, strong)NSNumber * infoType;
@end
