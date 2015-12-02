//
//  NewsReplyModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsReplyDataModel,NewsReplyDataDetailModel,NewsReplyDataDetail2Model;
@interface NewsReplyModel : BaseModel

@property (nonatomic, copy) NSString *docUrl;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *againstLock;

@property (nonatomic, strong) NSArray<NewsReplyDataModel *> *hotPosts;

@property (nonatomic, copy) NSString *audioLock;

@property (nonatomic, copy) NSString *isTagOff;

@property (nonatomic, assign)NSInteger againstcount;
@property (nonatomic, assign)NSInteger prcount;
@property (nonatomic, assign)NSInteger ptcount;
@property (nonatomic, assign)NSInteger tcountr;
@property (nonatomic, assign)NSInteger tcountt;
@property (nonatomic, assign)NSInteger votecount;

@end
@interface NewsReplyDataModel : BaseModel

@property (nonatomic, strong) NewsReplyDataDetailModel *detail;
@property (nonatomic, strong) NewsReplyDataDetail2Model * detail2;
@end

@interface NewsReplyDataDetailModel : BaseModel

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

@interface NewsReplyDataDetail2Model : BaseModel
@property (nonatomic, copy) NSString *p;
@property (nonatomic, copy) NSString *pi;
@property (nonatomic, copy) NSString *ip;
@property (nonatomic, copy) NSString *b;
@property (nonatomic, copy) NSString *rp;
@property (nonatomic, copy) NSString *u;
@property (nonatomic, copy) NSString *f;
@end
