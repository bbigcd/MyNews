//
//  NewsReplyModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class data,replyData,replyData2;
@interface NewsReplyModel : BaseModel

@property (nonatomic, copy) NSString *docUrl;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *againstLock;

@property (nonatomic, strong) NSArray<data *> *hotPosts;

@property (nonatomic, copy) NSString *audioLock;

@property (nonatomic, copy) NSString *isTagOff;

@end
@interface data : BaseModel

@property (nonatomic, strong) replyData *detail;
@property (nonatomic, strong) replyData2 * detail2;
@end

@interface replyData : BaseModel

@property (nonatomic, copy) NSString *p;

@property (nonatomic, copy) NSString *a;

@property (nonatomic, copy) NSString *pi;

@property (nonatomic, copy) NSString *ip;

@property (nonatomic, copy) NSString *b;

@property (nonatomic, copy) NSString *rp;

@property (nonatomic, copy) NSString *fi;

@property (nonatomic, copy) NSString *t;

@property (nonatomic, copy) NSString *u;

@property (nonatomic, copy) NSString *ut;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *timg;

@property (nonatomic, copy) NSString *f;

@property (nonatomic, copy) NSString *v;

@property (nonatomic, copy) NSString *n;

@end

@interface replyData2 : BaseModel
@property (nonatomic, copy) NSString *p;
@property (nonatomic, copy) NSString *pi;
@property (nonatomic, copy) NSString *ip;
@property (nonatomic, copy) NSString *b;
@property (nonatomic, copy) NSString *rp;
@property (nonatomic, copy) NSString *u;
@property (nonatomic, copy) NSString *f;
@end
