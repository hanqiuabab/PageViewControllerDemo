//
//  PageViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (nonatomic, strong) NSArray *viewControllerArray;

@property (nonatomic, assign) NSUInteger currentIndex;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (instancetype)initWithViewControllerArray:(NSArray *)viewControllerArray frame:(CGRect)frame {
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        self.view.frame = frame;
        self.delegate = self;
        self.dataSource = self;
        self.viewControllerArray = viewControllerArray;
        UIViewController *vc = viewControllerArray.firstObject;
        [self setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    }
    return self;
}

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated {
    [self setViewControllers:@[self.viewControllerArray[index]] direction:self.currentIndex > index ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finish){
        self.currentIndex = index;
    }];
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllerArray indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self.viewControllerArray objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllerArray indexOfObject:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == self.viewControllerArray.count) {
        return nil;
    }
    return [self.viewControllerArray objectAtIndex:index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        if (self.mdelegate && [self.mdelegate respondsToSelector:@selector(didScrollToIndex:)]) {
            [self.mdelegate didScrollToIndex:self.currentIndex];
        }
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    UIViewController *vc = [pendingViewControllers firstObject];
    NSUInteger index = [self.viewControllerArray indexOfObject:vc];
    
    self.currentIndex = index;
}
@end
