//
//  PageManagerViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "PageManagerViewController.h"
#import "PageViewController.h"

@interface PageManagerViewController ()<UIPageViewControllerDataSource>

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
        
        
        self.pageViewController.view.frame = frame;
        [self addChildViewController:self.pageViewController];
        
        [self.view addSubview:self.pageViewController.view];
        
        [self.pageViewController didMoveToParentViewController:self];
    }
    return self;
}

#pragma mark -- Getter
- (PageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[PageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource = self;
    }
    return _pageViewController;
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (self.currentIndex != 0) {
        return [self.viewControllerArray objectAtIndex:self.currentIndex-1];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (self.currentIndex != self.viewControllerArray.count-1) {
        return [self.viewControllerArray objectAtIndex:self.currentIndex+1];
    }
    return nil;
}
@end
