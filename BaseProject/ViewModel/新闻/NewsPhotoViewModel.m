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
