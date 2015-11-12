//
//  CDPageControl.m
//  BaseProject
//
//  Created by apple-jd03 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CDPageControl.h"

@implementation CDPageControl
- (void)updateDots{
    for (int i = 0; i<[self.subviews count]; i++) {
        UIImageView *imageView = [self.subviews objectAtIndex:i];
        CGSize size;
        size.height = 5;
        size.width = 5;
        [imageView setFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, size.width, size.height)];
        if (i == self.currentPage) {
//            imageView.backgroundColor = [UIColor blackColor];
            if ([self.superview isKindOfClass:[UIImageView class]]) {
                [imageView setImage:[UIImage imageNamed:@"vote_pager_circle"]];
            }
        }else{
//            imageView.backgroundColor = [UIColor lightGrayColor];
            if ([self.superview isKindOfClass:[UIImageView class]]) {
                [imageView setImage:[UIImage imageNamed:@"vote_pager_circle_gray"]];
            }
        }
    }
}

- (void)setCurrentPage:(NSInteger)currentPage{
    [super setCurrentPage:currentPage];
    [self updateDots];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
