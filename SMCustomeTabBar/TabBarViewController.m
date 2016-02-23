//
//  TabBarViewController.m
//  uhou
//
//  Created by admin on 15/11/6.
//  Copyright © 2015年 uhou. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "BaseNavigationController.h"

// 标签栏背景颜色
#define kTabBarBackgroundColor [UIColor colorWithRed:250.0 / 255 green:250.0 / 255 blue:250.0 / 255 alpha:1.0]

@interface TabBarViewController ()
@end

@implementation TabBarViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.delegate = self;
	// 初始化视图控制器
	[self _initViewControllers];
	// 初始自定义标签栏
	[self _initTabBarView];
	//移除红点提示
}

/**
 *  单例模式创建TabBar
 *
 *  @return
 */
+ (instancetype)shareTabBarViewController
{
	static TabBarViewController *tabBarVC = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		tabBarVC = [[self alloc] init];
	});
	return tabBarVC;
}

/**
 *  为tabbar添加小红点
 *
 *  @param index  标签栏item
 *  @param string 未读消息数
 */
- (void)addUnReadCountWithIndex:(NSInteger)index badgeValue:(NSString *)string
{
    [self.tabBar.items objectAtIndex:index].badgeValue = string;
}

///**
// *  隐藏tabbar
// */
//- (void)hidenTabBar {
//    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}
//
///**
// *  显示tabbar
// */
//- (void)showTabBar {
//    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}

// 初始化视图控制器
- (void)_initViewControllers
{
	// 创建标签视图控制器
	ViewController1 *vc1 = [[ViewController1 alloc] init];
    vc1.title = @"首页";
	ViewController2 *vc2 = [[ViewController2 alloc] init];
    vc2.title = @"消息";
	ViewController3 *vc3 = [[ViewController3 alloc] init];
    vc3.title = @"联系人";
	ViewController4 *vc4 = [[ViewController4 alloc] init];
    vc4.title = @"我的";
	// 将控制器存入数组
	NSArray *viewCtrlArray = @[vc1,vc2,vc3,vc4];
	// 创建可变数组，存放导航控制器
	NSMutableArray *navCtrls = [NSMutableArray array];
	// 遍历视图控制器数组
	for (UIViewController *viewCtrl in viewCtrlArray) {
		// 为视图控制器添加导航栏
		BaseNavigationController *navCtrl = [[BaseNavigationController alloc] initWithRootViewController:viewCtrl];
		navCtrl.delegate = self;
		[navCtrls addObject:navCtrl];
	}
	// 将导航控制器数组存入标签控制器
	self.viewControllers = navCtrls;
}

/**
 *  设置标签栏
 */
- (void)_initTabBarView
{
	// 设置标签栏为不透明
	self.tabBar.translucent = NO;
	// 隐藏标签栏
	self.tabBar.hidden = NO;
	self.tabBar.barTintColor = kTabBarBackgroundColor;
	self.tabBar.tintColor = kTabBarBackgroundColor;
	
	[[UITabBarItem appearance] setTitleTextAttributes:
		[NSDictionary dictionaryWithObjectsAndKeys:kTabBarBackgroundColor,
		 NSForegroundColorAttributeName, nil]forState:UIControlStateNormal];
	
	// 定义标签栏图片数组
	_imageNames = @[@"uhou.png",
					@"message.png",
					@"contact.png",
					@"main.png"];
	_selectedImageNames = @[@"uhou_selected.png",
							@"message_selected.png",
							@"contact_selected.png",
							@"main_selected.png"];
	
	for (int i = 0; i < _imageNames.count; i++) {
		UITabBarItem *item = self.tabBar.items[i];
		item.selectedImage = [[UIImage imageNamed:_selectedImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.tag = 10 + i;
		item.image = [[UIImage imageNamed:_imageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
		item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
	}
}

#pragma mark -标签栏代理方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
	if ([viewController isKindOfClass:[UINavigationController class]]) {
		[(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
	}
    
    // 创建弹性效果关键帧动画
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    // 设置放大倍数
    keyFrame.values = @[@1.4,@1.0,@1.25,@1.0,@1.125,@1.0,@1.06,@1.0];
    // 设置动画时间
    keyFrame.duration = .5;
    // 设置放大效果每帧时间
    keyFrame.keyTimes = @[@.1,@.3,@.5,@.7,@.85,@.95,@1.0];
    // 添加关键帧动画
    [[[[self.tabBar subviews] objectAtIndex:tabBarController.selectedIndex + 1] layer] addAnimation:keyFrame forKey:@"keyFrame"];
}

#pragma mark - **************** 内存警告处理
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
		if (!self.view.window) {
			_imageNames = nil;
			_selectedImageNames = nil;
			self.view = nil;
		}
	}
}
@end
