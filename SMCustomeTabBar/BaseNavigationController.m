//
//  ViewController.m
//  SMCustomeTabBar
//
//  Created by Sunny on 16/2/20.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationBar+Awesome.h"

// 导航栏背景颜色
#define kNavBackgroundColor [UIColor colorWithRed:250.0 / 255 green:250.0 / 255 blue:250.0 / 255 alpha:1.0]

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 将导航栏设置为透明
    self.navigationBar.translucent = YES;
    // 设置导航栏背景颜色
    [self.navigationBar lt_setBackgroundColor:kNavBackgroundColor];
    // 设置导航栏阴影
    self.navigationBar.shadowImage = [UIImage imageNamed:@"shadow"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
