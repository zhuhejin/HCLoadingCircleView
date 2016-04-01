//
//  ViewController.m
//  LoadingNavigationBar
//
//  Created by 朱何进 on 16/3/4.
//  Copyright © 2016年 hejin. All rights reserved.
//

#import "ViewController.h"
#import "HCLoadingCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HCLoadingCircleView *loadingView = [[HCLoadingCircleView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:loadingView];
    
    self.navigationItem.rightBarButtonItem = item;
    
    [loadingView startAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
