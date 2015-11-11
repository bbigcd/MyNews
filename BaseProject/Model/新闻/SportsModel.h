//
//  SportsModel.h
//  网易新闻
//  体育
//  Created by apple-jd03 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@interface SportsModel : BaseModel


@property (nonatomic, strong) NSArray *T1348649079062;

@end
@interface SportsT1348649079062Model : BaseModel

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

@property (nonatomic, copy) NSString *ktemplate;

@property (nonatomic, assign) NSInteger votecount;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *skipType;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, strong) NSArray *ads;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *specialID;

@property (nonatomic, copy) NSString *skipID;

@property (nonatomic, copy) NSString *boardid;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@property (nonatomic, copy) NSArray *imgextra;

@end

@interface SportsT1348649079062AdsModel : BaseModel

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *imgsrc;

@end


@interface SportsT1348649079062imgextraModel : BaseModel

@property (nonatomic, copy) NSString *imgsrc;

@end
