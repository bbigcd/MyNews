//
//  NewsAllModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface NewsAllModel : BaseModel

@property (nonatomic, strong) NSArray *data;

@end
@class NewsAllDataImgModel;
@interface NewsAllDataModel : BaseModel
/*! 新闻类型名：（如头条） */
@property (nonatomic, copy) NSString *tname;

/*! 新闻发布时间 */
@property (nonatomic, copy) NSString *ptime;

/*! 标题 */
@property (nonatomic, copy) NSString *title;

/*! 新闻详情 */
@property (nonatomic, copy) NSString *digest;

/*! 多图数组 */
@property (nonatomic, strong) NSArray *imgextra;
@property (nonatomic, copy) NSString *photosetID;
@property (nonatomic, assign) NSInteger hasHead;
@property (nonatomic, assign) NSInteger hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *ktemplate;
/*! 通过此标识来判断是否是图片新闻 */
@property (nonatomic, copy) NSString *skipType;

/*! 跟帖人数 */
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, assign) NSInteger votecount;

/*! 新闻来源 */
@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *alias;

/*! 新闻ID */
@property (nonatomic, copy) NSString *docid;//根据这个来推出详情页
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) NSInteger hasAD;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic,strong)NSArray *videoID;

/*! 图片链接 */
//滚动栏的信息数组
@property (nonatomic, strong) NSArray<NewsAllDataImgModel *> *ads;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *skipID;
@property (nonatomic, assign) NSInteger order;

/*! 详情页连接 */
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *url_3w;

/*! 论坛 */
@property (nonatomic,copy) NSString *boardid;

/*! skipType类型为special时：特别 */
@property (nonatomic,copy) NSString *specialID;

/*! 视频 */
@property (nonatomic,copy) NSString *TAGS;
@property (nonatomic,copy) NSString *TAG;
@property (nonatomic,copy) NSString *videosource;
@end


/*! 滚动栏图片数组 */
@interface NewsAllDataImgModel : BaseModel

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *imgsrc;

@end

/*! 图片新闻的图片URL地址 */
@interface NewsAllDataImgUrlModel: BaseModel
@property (nonatomic, copy) NSString *imgsrc;
@end
