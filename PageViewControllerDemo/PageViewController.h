//
//  PageViewController.h
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageViewControllerDelegate <NSObject>

- (void)didScrollToIndex:(NSUInteger)index;

@end

@interface PageViewController : UIPageViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>


- (instancetype)initWithViewControllerArray:(NSArray *)viewControllerArray frame:(CGRect)frame;
- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated;

@property (nonatomic, weak) id<PageViewControllerDelegate> mdelegate;

@end
