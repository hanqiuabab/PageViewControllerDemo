//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ViewController.h"

#import "TitlePageViewController.h"

@interface ViewController ()

@property (nonatomic, strong) TitlePageViewController *titlePage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIViewController *a = [UIViewController new];
    a.view.backgroundColor = [UIColor redColor];
    a.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);
    
    UIViewController *b = [UIViewController new];
    b.view.backgroundColor = [UIColor blueColor];
    b.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);

    UIViewController *c = [UIViewController new];
    c.view.backgroundColor = [UIColor yellowColor];
    c.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);

    UIViewController *d = [UIViewController new];
    d.view.backgroundColor = [UIColor greenColor];
    d.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);

    self.titlePage = [[TitlePageViewController alloc] initWithTitleArray:@[@"红色",@"蓝色",@"黄色",@"绿色"] viewControllerArray:@[a,b,c,d]];
    
    [self addChildViewController:self.titlePage];
    self.titlePage.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    [self.view addSubview:self.titlePage.view];
    [self.titlePage didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
}

@end
