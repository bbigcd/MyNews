//
//  ShiPinModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class Vap4Bfe3U;
@interface ShiPinModel : BaseModel

@property (nonatomic, strong) NSArray<Vap4Bfe3U *> *VAP4BFE3U;

@end
@interface Vap4Bfe3U : NSObject

@property (nonatomic, copy) NSString *kdescription;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;

@end

