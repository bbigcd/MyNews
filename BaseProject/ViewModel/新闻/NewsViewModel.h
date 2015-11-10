//
//  NewsViewModel.h
//  网易新闻
//
//  Created by apple-jd03 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"
@interface NewsViewModel : BaseViewModel
/*! 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithType:(InfoType)type;

/*! 初始化类型 */
@property (nonatomic)InfoType type;

/*! 当前页数的索引值 */
@property (nonatomic)NSInteger start;

/*! 行数 */
@property (nonatomic)NSInteger rowNumber;

/*! 存放头部滚动栏的数组 */
@property (nonatomic, strong)NSArray * adsArr;

/*! 是否有头部滚动栏 */
- (BOOL)containAds:(NSInteger)row;

/*! 判断某一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/*! 通过行数返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRow:(NSInteger)row;

/*! 返回列表中某行数据的题目 */
- (NSString *)titleForRowInHeadLine:(NSInteger)row;

/*! 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInHeadLine:(NSInteger)row;

/*! 返回列表中某行数据的描述 */
- (NSString *)digestForRowInHeadLine:(NSInteger)row;

/*! 返回列表中某行数据的浏览人数 */
- (NSString *)replyCountForRowInHeadLine:(NSInteger)row;

/*! 当前数据类型是图片 pic */
- (BOOL)isPicForRow:(NSInteger)row;

/*! 当前数据类型是html all */
- (BOOL)isHtmlForRow:(NSInteger)row;















@end
