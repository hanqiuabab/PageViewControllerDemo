//
//  TitlePageViewController.h
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitlePageViewController : UIViewController

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSArray *viewControllerArray;

- (instancetype)initWithTitleArray:(NSArray *)titleArray viewControllerArray:(NSArray *)viewControllerArray;
@end
