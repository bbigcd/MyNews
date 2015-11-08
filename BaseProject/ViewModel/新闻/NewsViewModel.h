//
//  NewsViewModel.h
//  网易新闻
//
//  Created by apple-jd03 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"
@interface NewsViewModel : BaseViewModel
/*! 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithType:(InfoType)type;
@end
