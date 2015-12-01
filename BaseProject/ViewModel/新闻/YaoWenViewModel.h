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

/*! 返回列表中某行数据的photosetID */
- (NSString *)photosetIDForRow:(NSInteger)row;

/*! 返回列表中某行数据的多图数组 */
- (NSArray *)iconsURLSForRow:(NSInteger)row;

/*! 详情传值 */
- (NSString *)docidForRow:(NSInteger)row;
- (NSString *)boardidForRow:(NSInteger)row;

/*! 返回详情页中的浏览人数（无跟帖） */
- (NSInteger)replyCountDetailForRow:(NSInteger)row;

/*! 当前数据类型是html all */
- (BOOL)isHtmlForRow:(NSInteger)row;

/*! 当前数据类型是图片 all */
- (BOOL)isPicForRow:(NSInteger)row;

/*! 当前数据类型是视频 all */
- (BOOL)isVideoForRow:(NSInteger)row;

/*! 当前数据类型是特殊 all */
- (BOOL)isSpecialForRow:(NSInteger)row;

/*! 当前数据类型是独家 all */
- (BOOL)isDuJiaForRow:(NSInteger)row;

@end
