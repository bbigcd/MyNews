//
//  ListenModel.h
//  网易新闻
//
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class ListenClistTlistRadioModel;
@interface ListenModel : BaseModel
@property (nonatomic, strong) NSArray *cList;
@property (nonatomic, strong) NSArray *top;
@end


@interface ListenClistModel : BaseModel

@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *cname;
@property (nonatomic, strong) NSArray *tList;

@end

@interface ListenClistTlistModel : BaseModel

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *subnum;
@property (nonatomic, assign) NSInteger isHot;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, assign) NSInteger isNew;
@property (nonatomic, copy) NSString *Template;
@property (nonatomic, assign) NSInteger recommendOrder;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, assign) NSInteger bannerOrder;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, strong) ListenClistTlistRadioModel *radio;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *recommend;
@property (nonatomic, assign) BOOL headLine;
@property (nonatomic, copy) NSString *topicid;
@property (nonatomic, copy) NSString *showType;

@end

@interface ListenClistTlistRadioModel : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *TAG;
@property (nonatomic, copy) NSString *url_3w;
@property (nonatomic, assign) NSInteger hasHead;
@property (nonatomic, assign) NSInteger hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSString *TAGS;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *Template;
@property (nonatomic, assign) NSInteger votecount;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *size;
@property (nonatomic, assign) NSInteger hasAD;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *boardid;
@property (nonatomic, assign) NSInteger order;
@property (nonatomic, copy) NSString *digest;

@end

