//
//  NewsPicViewController.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPicViewController : UIViewController
- (id)initWithPhotosetID:(NSString *)photosetID replyCount:(NSInteger)reply;
@property (nonatomic, strong)NSString * url;
@end
