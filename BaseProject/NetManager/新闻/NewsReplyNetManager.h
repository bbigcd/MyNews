//
//  NewsReplyNetManager.h
//  BaseProject
//
//  Created by apple-jd03 on 15/11/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsReplyModel.h"
@interface NewsReplyNetManager : BaseNetManager
/**
 *  BoardID:  news3_bbs       Docid:  B9H3AG4600014AED
 *
 *  @param boardid          上一层传下来的：news3_bbs
 *  @param docid            上一层传下来的：B9H3AG4600014AED
 *  @param completionHandle 请求评论信息
 *
 *  @return 返回评论信息
 */
+ (id)getReplyWithBoardIDAndDocid:(NSString *)boardid docid:(NSString *)docid index:(NSInteger)index completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
