//
//  PageManagerViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "PageManagerViewController.h"
#import "PageViewController.h"

@interface PageManagerViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic, strong) PageViewController *pageViewController;

@property (nonatomic, strong) NSArray *viewControllerArray;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation PageManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithViewControllerArray:(NSArray *)viewControllerArray frame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.viewControllerArray = viewControllerArray;
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.pageViewController.view.frame = frame;
        [self addChildViewController:self.pageViewController];
        
        [self.view addSubview:self.pageViewController.view];
        
        [self.pageViewController didMoveToParentViewController:self];
        
        [self.pageViewController setViewControllers:@[self.viewControllerArray[0]] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    }
    return self;
}

- (void)scrollToIndex:(NSUInteger)index animated:(BOOL)animated {
    [self.pageViewController setViewControllers:@[self.viewControllerArray[index]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}
#pragma mark -- Getter
- (PageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[PageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource = self;
        _pageViewController.delegate = self;
    }
    return _pageViewController;
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
        if (self.delegate && [self.delegate respondsToSelector:@selector(didScrollToIndex:)]) {
            [self.delegate didScrollToIndex:self.currentIndex];
        }
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    UIViewController *vc = [pendingViewControllers firstObject];
    NSUInteger index = [self.viewControllerArray indexOfObject:vc];
    
    self.currentIndex = index;
}

@end
