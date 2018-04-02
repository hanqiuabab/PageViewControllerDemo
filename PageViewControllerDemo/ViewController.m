//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ViewController.h"
#import "PageManagerViewController.h"

@interface ViewController ()<PageManagerViewControllerDelegate>

@property (nonatomic, strong) PageManagerViewController *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIViewController *aViewController = [[UIViewController alloc] init];
    aViewController.view.backgroundColor = [UIColor redColor];
    
    UIViewController *bViewController = [[UIViewController alloc] init];
    bViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *cViewController = [[UIViewController alloc] init];
    cViewController.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *dViewController = [[UIViewController alloc] init];
    dViewController.view.backgroundColor = [UIColor orangeColor];
    self.manager = [[PageManagerViewController alloc] initWithViewControllerArray:@[aViewController,bViewController,cViewController,dViewController] frame:self.view.bounds];
    self.manager.delegate = self;
    
    [self addChildViewController:self.manager];
    [self.view addSubview:self.manager.view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:self.manager animated:YES];
}

- (void)didScrollToIndex:(NSUInteger)index {
    NSLog(@"didScrollToIndex:%d",index);
}
@end
