//
//  NewsPhotoViewModel.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/25.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsPhotoViewModel.h"

@implementation NewsPhotoViewModel
- (instancetype)initWithPhotosetID:(NSString *)first Last:(NSString *)last{
    if (self = [super init]) {
        _first = first;
        _last = last;
    }
    return self;
}
//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}
- (NewsPhotoModel *)modelInPhoto:(NSInteger)row{
    return self.dataArr[row];
}
- (NewsPhotoArrModel *)modelInPhotoArrForRow:(NSInteger)row{
    return self.photos[row];
}
- (NSString *)photoCount{
    return [self modelInPhoto:0].imgsum;
}
- (NSString *)title{
    return [self modelInPhoto:0].setname;
}
- (NSString *)descInEachPhotoForRow:(NSInteger)row{
    return [self modelInPhotoArrForRow:row].note;
}
- (NSString *)imgurlInEachPhotoForRow:(NSInteger)row{
    return [self modelInPhotoArrForRow:row].imgurl;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [NewsPhotoNetManager getYaoWenWithPhotosetID:_first index:_last completionHandle:^(NewsPhotoModel *model, NSError *error) {
        [self.dataArr addObject:model];
        self.photos = model.photos;
        completionHandle(error);
    }];
}
@end
