//
//  YaoWenModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/24.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@interface YaoWenModel : BaseModel

@property (nonatomic, strong) NSArray *data;

@end
@interface YaoWenDataModel : BaseModel
/*! 通过此标识来判断新闻类型 */
@property (nonatomic, copy) NSString *skipType;
@property (nonatomic, copy) NSString *skipID;
@property (nonatomic, copy) NSString *specialID;

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *url_3w;

@property (nonatomic, copy) NSString *TAG;
@property (nonatomic, copy) NSString *TAGS;

@property (nonatomic, assign) NSInteger hasHead;
@property (nonatomic, assign) NSInteger hasImg;
@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *docid;


@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *ktemplate;
@property (nonatomic, assign) NSInteger votecount;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, assign) NSInteger hasAD;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *boardid;
@property (nonatomic, assign) NSInteger order;
@property (nonatomic, copy) NSString *digest;


@end

