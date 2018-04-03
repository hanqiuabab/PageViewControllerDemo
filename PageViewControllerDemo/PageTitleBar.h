//
//  PageTitleBar.h
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PageTitleBarDelegate <NSObject>

- (void)didSelectedIndex:(NSInteger)index;

@end
@interface PageTitleBar : UIView

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) NSInteger currentSelected;
@property (nonatomic, weak) id<PageTitleBarDelegate> delegate;

- (instancetype)initWithTitleArray:(NSArray *)titleArray;

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated;
@end
