//
//  NewsImageCell.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDImageView.h"
@interface NewsImageCell : UITableViewCell

/*! 题目标签 */
@property (nonatomic, strong)UILabel * titleLb;

/*! 点击数标签 */
@property (nonatomic, strong)UILabel * clicksNumLb;

/*! 图片1 */
@property (nonatomic, strong)CDImageView * iconIV0;

/*! 图片2 */
@property (nonatomic, strong)CDImageView * iconIV1;

/*! 图片3 */
@property (nonatomic, strong)CDImageView * iconIV2;





@end
