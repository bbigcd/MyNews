//
//  NewsPhotoModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface NewsPhotoModel : BaseModel

@property (nonatomic, copy) NSString *scover;

@property (nonatomic, copy) NSString *setname;

@property (nonatomic, copy) NSString *reporter;

@property (nonatomic, copy) NSString *creator;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *clientadurl;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *postid;

@property (nonatomic, strong) NSArray *relatedids;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *settag;

@property (nonatomic, copy) NSString *imgsum;

@property (nonatomic, copy) NSString *commenturl;

@property (nonatomic, strong) NSArray *photos;

@property (nonatomic, copy) NSString *tcover;

@property (nonatomic, copy) NSString *createdate;

@property (nonatomic, copy) NSString *series;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *datatime;

@property (nonatomic, copy) NSString *autoid;

@property (nonatomic, copy) NSString *boardid;



@end
@interface NewsPhotoArrModel : BaseModel

@property (nonatomic, copy) NSString *imgurl;

@property (nonatomic, copy) NSString *note;

@property (nonatomic, copy) NSString *photoid;

@property (nonatomic, copy) NSString *timgurl;

@property (nonatomic, copy) NSString *simgurl;

@property (nonatomic, copy) NSString *imgtitle;

@property (nonatomic, copy) NSString *newsurl;

@property (nonatomic, copy) NSString *photohtml;

@property (nonatomic, copy) NSString *squareimgurl;

@property (nonatomic, copy) NSString *cimgurl;



@end

