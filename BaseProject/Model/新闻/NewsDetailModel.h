//
//  NewsDetailModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface NewsDetailModel : BaseModel

@property (nonatomic, strong) NSArray *data;

@end

@interface NewsDetailDataModel : BaseModel
/** 新闻发布时间 */
@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, strong) NSArray *link;
/** 新闻标题 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSArray *boboList;

@property (nonatomic, strong) NSArray *img;

@property (nonatomic, strong) NSArray *topiclist_news;

@property (nonatomic, strong) NSArray *ydbaike;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL picnews;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *ktemplate;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) BOOL hasNext;

@property (nonatomic, strong) NSArray *topiclist;
/** 新闻内容 */
@property (nonatomic, copy) NSString *body;

@property (nonatomic, assign) NSInteger threadAgainst;

@property (nonatomic, strong) NSArray *votes;

@property (nonatomic, copy) NSString *voicecomment;

@property (nonatomic, copy) NSString *dkeys;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, assign) NSInteger threadVote;

@property (nonatomic, strong) NSArray *relative_sys;

@property (nonatomic, copy) NSString *digest;

+ (instancetype)detailWithDict:(NSDictionary *)dict;

@end

@interface NewsDetailDataImgModel : BaseModel
/** 图片尺寸 */
@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *src;
/** 图片所处的位置 */
@property (nonatomic, copy) NSString *ref;
+ (instancetype)detailImgWithDict:(NSDictionary *)dict;
@end

@interface NewsDetailDataTopiclistModel : BaseModel

@property (nonatomic, copy) NSString *subnum;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *cid;

@end

@interface NewsDetailDataTopiclist_NewsModel : BaseModel

@property (nonatomic, copy) NSString *subnum;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *cid;

@end

