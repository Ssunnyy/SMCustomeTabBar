//
//  ViewController1.m
//  SMCustomeTabBar
//
//  Created by Sunny on 16/2/20.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "ViewController1.h"
#import "HidenTabBarController.h"

// 获取当前设备的宽和高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kScreenWidth - 100) / 2, 100, 100, 100);
    
    button.backgroundColor = [UIColor grayColor];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button setTitle:@"隐藏tabbar" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hidenTabbar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

- (void) hidenTabbar {
    
    HidenTabBarController *hiden = [[HidenTabBarController alloc]init];
    hiden.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:hiden animated:YES];
    
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
