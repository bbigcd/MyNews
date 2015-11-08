//
//  NewsListCell.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDImageView.h"
@interface NewsListCell : UITableViewCell
/*! 左侧图片 */
//用CDImageView类型创建
@property (nonatomic, strong)CDImageView * iconIV;

/*! 题目标签 */
@property (nonatomic, strong)UILabel * titleLb;

/*! 长题目标签 */
@property (nonatomic, strong)UILabel * longTitleLb;

/*! 点击数标签 */
/*! label for clicks number */
@property (nonatomic, strong)UILabel * clicksNumLb;
@end
