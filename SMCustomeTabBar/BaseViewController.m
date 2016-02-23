//
//  BaseViewController.m
//  SMCustomeTabBar
//
//  Created by Sunny on 16/2/20.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "BaseViewController.h"
#import "TabBarViewController.h"
// 非纯白背景颜色
#define kWhiteBackgroundColor [UIColor colorWithRed:30.0 / 255 green:30.0 / 255 blue:30.0 / 255 alpha:1.0]

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
//    if (self.navigationController.viewControllers.count > 1) {
//        [[TabBarViewController shareTabBarViewController] hidenTabBar];
//    }else {
//        [[TabBarViewController shareTabBarViewController] showTabBar];
//    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置导航栏标题字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:kWhiteBackgroundColor}];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
