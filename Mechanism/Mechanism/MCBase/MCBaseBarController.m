//
//  MCBaseBarController.m
//  Mechanism
//
//  Created by 赵博宇 on 2017/9/8.
//  Copyright © 2017年 赵博宇. All rights reserved.
//

#import "MCBaseBarController.h"

@interface MCBaseBarController ()<UINavigationControllerDelegate>

@end

@implementation MCBaseBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = BlueColor;
    [self initViewControllers];
}
- (void) initViewControllers{

    MCAdminsterViewController *advc = [[MCAdminsterViewController alloc] init];
    self.AdminNavigationVC = [self createController:advc];
    
    MCToolViewController *toolVC = [[MCToolViewController alloc] init];
    self.ToolNavigationVC = [self createController:toolVC];
    
    MCMeViewController *meVC = [[MCMeViewController alloc]init];
    self.MeNavigationVC  = [self createController:meVC];
    
    
  
    self.viewControllers = [NSArray arrayWithObjects:self.AdminNavigationVC,self.ToolNavigationVC,self.MeNavigationVC, nil];
    
    [self setUptabBarItem];
}
-(void)setUptabBarItem
{
    
    self.AdminNavigationVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"管理" image:[UIImage imageNamed:@"icon_normal_gongzuotai"] selectedImage:[UIImage imageNamed:@"icon_pressed_gongzuotai"]];
    
    self.ToolNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"工具"image:[UIImage imageNamed:@"icon_normal_qicheguan"]  selectedImage:[UIImage imageNamed:@"icon_pressed_qicheguan"]];
    self.MeNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"icon_normal_kehuguanli"]  selectedImage:[UIImage imageNamed:@"icon_pressed_kehuguanli"]];
  
}
- (MCBaseNavigationController *) createController:(UIViewController *) controller
{
    MCBaseNavigationController *nav = [[MCBaseNavigationController alloc] initWithRootViewController:controller];
    [nav setDelegate:self];
    nav.navigationBar.translucent = NO;
    return nav;
}
@end
