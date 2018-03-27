//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/3/27.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ViewController.h"
#import "PageManagerViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PageManagerViewController *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIViewController *aViewController = [[UIViewController alloc] init];
    aViewController.view.backgroundColor = [UIColor redColor];
    
    UIViewController *bViewController = [[UIViewController alloc] init];
    bViewController.view.backgroundColor = [UIColor yellowColor];
    
    self.manager = [[PageManagerViewController alloc] initWithViewControllerArray:@[aViewController,bViewController]frame:self.view.bounds];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:self.manager animated:YES];
}

@end
