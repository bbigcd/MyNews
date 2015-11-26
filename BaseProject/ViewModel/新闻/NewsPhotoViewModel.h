//
//  NewsPhotoViewModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsPhotoNetManager.h"
@interface NewsPhotoViewModel : BaseViewModel
/*! 必须使用此初始化方法，需要两个类型 */
- (instancetype)initWithPhotosetID:(NSString *)first Last:(NSString *)last;
/*! 当前页数的索引值 */
@property (nonatomic, strong)NSString * first;

/*! 当前页数的索引值 */
@property (nonatomic, strong)NSString * last;

/*! 新闻标题 */
@property (nonatomic, strong)NSString * title;

/*! 图片总数 */
@property (nonatomic, strong)NSString * photoCount;

/*! 每一页图片的详情 */
- (NSString *)descInEachPhotoForRow:(NSInteger)row;

/*! 图片数组 */
@property (nonatomic, strong)NSArray * photos;

/*! 每一页图片的地址 */
- (NSString *)imgurlInEachPhotoForRow:(NSInteger)row;
@end
