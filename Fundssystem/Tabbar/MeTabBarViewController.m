//
//  MeTabBarViewController.m
//  Fundssystem
//
//  Created by Migoo on 16/6/15.
//  Copyright © 2016年 Migoo. All rights reserved.
//

#import "MeTabBarViewController.h"
#import "CheckViewController.h"
#import "QueryViewController.h"
#import "MeViewController.h"

@interface MeTabBarViewController ()

@end

@implementation MeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // 1.初始化子控制器
    CheckViewController *check = [[CheckViewController alloc]init];
    [self addChildVc:check title:@"申请模块" image:@"HeTGL" selectedImage:@""];
    
    QueryViewController *query = [[QueryViewController alloc]init];
    [self addChildVc:query title:@"审批模块" image:@"HeTGL" selectedImage:@""];
    
    MeViewController *me = [[MeViewController alloc]init];
    [self addChildVc:me title:@"我的" image:@"HeTGL" selectedImage:@""];
    
    
    // Do any additional setup after loading the view.
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
   //  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:childVc];
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
