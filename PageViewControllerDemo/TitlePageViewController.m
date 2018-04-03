//
//  TitlePageViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "TitlePageViewController.h"
#import "PageViewController.h"
#import "PageTitleBar.h"

@interface TitlePageViewController ()<PageTitleBarDelegate,PageViewControllerDelegate>

@property (nonatomic, strong) PageTitleBar *titleBar;

@property (nonatomic, strong) PageViewController *pageViewController;

@end

@implementation TitlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (instancetype)initWithTitleArray:(NSArray *)titleArray viewControllerArray:(NSArray *)viewControllerArray {
    self = [super init];
    if (self) {
        self.titleArray = titleArray;
        self.viewControllerArray = viewControllerArray;
        [self setupPageViewController];
    }
    return self;
}

#pragma private
- (void)setupPageViewController {
    self.titleBar = [[PageTitleBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    self.titleBar.backgroundColor =[UIColor grayColor];
    self.titleBar.titleArray = self.titleArray;
    self.titleBar.delegate = self;
    [self.view addSubview:self.titleBar];
    
    self.pageViewController = [[PageViewController alloc] initWithViewControllerArray:self.viewControllerArray frame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    self.pageViewController.mdelegate = self;
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - TitleBar delegate
- (void)didSelectedIndex:(NSInteger)index {
    [self.pageViewController scrollToIndex:index animated:YES];
}

#pragma mark - PageViewController delegate
- (void)didScrollToIndex:(NSUInteger)index {
    [self.titleBar scrollToIndex:index animated:YES];
    
}
@end
