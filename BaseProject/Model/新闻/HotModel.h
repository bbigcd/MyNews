//
//  HotModel.h
//  网易新闻
//  热点
//  Created by apple-jd03 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@interface HotModel : BaseModel

@property (nonatomic, strong) NSArray *tuiJian;

@end
@interface HottuiJianModel : BaseModel

@property (nonatomic, assign) NSInteger recType;

@property (nonatomic, copy) NSString *skipType;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, assign) NSInteger picCount;

@property (nonatomic, copy) NSString *prompt;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *skipID;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger imgType;

@property (nonatomic, copy) NSString *photosetID;

@property (nonatomic, copy) NSString *program;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger clkNum;

@end

