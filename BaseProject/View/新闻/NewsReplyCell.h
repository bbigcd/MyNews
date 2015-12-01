//
//  NewsReplyCell.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDImageView.h"
@interface NewsReplyCell : UITableViewCell
/*! 用户头像 */
@property (nonatomic, strong)CDImageView * headIV;

/*! 用户的发言 */
@property (nonatomic, strong)UILabel * sayLabel;

/*! 用户的名称 */
@property (nonatomic, strong)UILabel * nameLabel;

/*! 用户的ip信息 */
@property (nonatomic, strong)UILabel * addressLabel;

/*! 用户的点赞数 */
@property (nonatomic, strong)UILabel * supposeLabel;


@end
