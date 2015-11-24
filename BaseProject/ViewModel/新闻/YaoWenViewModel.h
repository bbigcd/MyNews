//
//  YaoWenViewModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "YaoWenNetManager.h"
@interface YaoWenViewModel : BaseViewModel
/*! 当前页数的索引值 */
@property (nonatomic)NSInteger start;

/*! 当前页数的索引值 */
@property (nonatomic)NSInteger index;

/*! 行数 */
@property (nonatomic)NSInteger rowNumber;

/*! 返回列表中某行数据的题目 */
- (NSString *)titleForRow:(NSInteger)row;

/*! 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRow:(NSInteger)row;

/*! 返回列表中某行数据的描述 */
- (NSString *)digestForRow:(NSInteger)row;

/*! 返回列表中某行数据的浏览人数 */
- (NSString *)replyCountForRow:(NSInteger)row;
@end
