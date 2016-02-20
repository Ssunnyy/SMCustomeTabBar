//
//  TabBarViewController.h
//  uhou
//
//  Created by admin on 15/11/6.
//  Copyright © 2015年 uhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController<UINavigationControllerDelegate,UINavigationBarDelegate,UITabBarControllerDelegate>
{
    // 标签栏图片数组
    NSArray *_imageNames;
    NSArray *_selectedImageNames;
}

/**
 *  单例模式创建TabBar
 *
 *  @return 
 */
+ (instancetype)shareTabBarViewController;

/**
 *  为tabbar添加小红点
 *
 *  @param index  标签栏item
 *  @param string 未读消息数
 */
- (void)addUnReadCountWithIndex:(NSInteger)index badgeValue:(NSString *)string;

/**
 *  隐藏tabbar
 */
- (void)hidenTabBar;

/**
 *  显示tabbar
 */
- (void)showTabBar;

@end
