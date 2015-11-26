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

/*! 当前页数的索引值 */
@property (nonatomic)NSInteger index;

/*! 行数 */
@property (nonatomic)NSInteger rowNumber;

/*! 存放头部滚动栏的数组 */
@property (nonatomic, strong)NSArray * adsArr;

/*! 是否有头部滚动栏 */
@property (nonatomic, getter=isHashead)BOOL hasHead;

/*! 判断某一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/*! 通过行数返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRow:(NSInteger)row;

/*! 返回列表中某行数据的题目 */
- (NSString *)titleForRow:(NSInteger)row;

/*! 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRow:(NSInteger)row;

/*! 返回列表中某行数据的描述 */
- (NSString *)digestForRow:(NSInteger)row;

/*! 返回列表中某行数据的浏览人数 */
- (NSString *)replyCountForRow:(NSInteger)row;

/*! 返回详情页中的浏览人数（无跟帖） */
- (NSInteger)replyCountDetailForRow:(NSInteger)row;

/*! 展示滚动栏的题目 */
- (NSString *)titleForRowInAds:(NSInteger)row;

/*! 展示滚动栏的图片 */
- (NSURL *)iconURLForRowInAds:(NSInteger)row;

/*! 对应的html5链接 */
- (NSString *)detailURLForRow:(NSInteger)row;

/*! 滚动展示栏的图片数量 */
@property (nonatomic)NSInteger indexPicNumber;

/*! 当前数据类型是图片 pic */
- (BOOL)isPicForRow:(NSInteger)row;
- (BOOL)isPicForRowInHead:(NSInteger)row;
- (NSString *)photosetIDForRow:(NSInteger)row;

/*! 当前数据类型是html all */
- (BOOL)isHtmlForRow:(NSInteger)row;
- (BOOL)isHtmlForRowInHead:(NSInteger)row;

/*! 当前数据类型是视频 video */
- (BOOL)isVideoForRow:(NSInteger)row;
- (BOOL)isVideoForRowInHead:(NSInteger)row;





@end
