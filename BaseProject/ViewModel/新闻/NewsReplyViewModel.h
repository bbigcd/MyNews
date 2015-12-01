//
//  NewsReplyViewModel.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsReplyViewModel : BaseViewModel
/*! 必须使用此初始化方法，需要两个类型 */
- (instancetype)initWithBoardIDAndDocid:(NSString *)boardid docid:(NSString *)docid;
@property(nonatomic,copy) NSString *boardid;
@property(nonatomic,copy) NSString *docid;
@property (nonatomic)NSInteger index;
/*! 行数 */
@property (nonatomic)NSInteger rowNumber;
/** 用户的姓名 */
- (NSString *)nameForRow:(NSInteger)row;
/** 用户的ip信息 */
- (NSString *)addressForRow:(NSInteger)row;
/** 用户的发言 */
- (NSString *)sayForRow:(NSInteger)row;
/** 用户的点赞 */
- (NSString *)supposeForRow:(NSInteger)row;
/*! 用户的头像 */
- (NSString *)headForRow:(NSInteger)row;
@end
