//
//  NewsDetailModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface NewsDetailModel : BaseModel
/** 新闻标题 */
@property (nonatomic, copy) NSString *title;
/** 新闻发布时间 */
@property (nonatomic, copy) NSString *ptime;
/** 新闻内容 */
@property (nonatomic, copy) NSString *body;
/** 新闻配图(希望这个数组中以后放HMNewsDetailImg模型) */
@property (nonatomic, strong) NSArray *img;
+ (instancetype)detailWithDict:(NSDictionary *)dict;
@end

@interface NewsDetailImgModel : BaseModel
@property (nonatomic, copy) NSString *src;
/** 图片尺寸 */
@property (nonatomic, copy) NSString *pixel;
/** 图片所处的位置 */
@property (nonatomic, copy) NSString *ref;
+ (instancetype)detailImgWithDict:(NSDictionary *)dict;
@end