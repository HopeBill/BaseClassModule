//
//  TabbarViewController.m
//  LKB
//
//  Created by lee on 16/5/17.
//  Copyright © 2016年 Libiyong. All rights reserved.
//

#import "TabbarViewController.h"
#import "NavigationController.h"
#import "ResourceUtilityClass.h"
#import "CTMediator+ModuleActions.h"
@interface TabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation TabbarViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate=self;
   
    [self setChildController:[[CTMediator sharedInstance] CTMediator_tabBarViewControllerOne] title:@"首页" image:@"icon_shouye_deselect@2x.png" selectedImage:@"icon_shouye_select@2x.png" withTag:0];
    
     [self setChildController: [[CTMediator sharedInstance] CTMediator_tabBarViewControllerOne] title:@"消息" image:@"icon_mess_deselect@2x.png" selectedImage:@"icon_mess_select@2x.png" withTag:1];
    
     [self setChildController:[[CTMediator sharedInstance] CTMediator_tabBarViewControllerOne] title:@"订单" image:@"icon_order_deselect@2x.png" selectedImage:@"icon_order_select@2x.png" withTag:2];
    
     [self setChildController:[[CTMediator sharedInstance] CTMediator_tabBarViewControllerOne] title:@"我的" image:@"icon_my_deselsct@2x.png" selectedImage:@"icon_my_selsct@2x.png" withTag:3];

//    [self initialize];
}

-(void)initialize {
    
    
    //设置tabbar背景颜色
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //隐藏tabbar上面的横线
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //设置tabbar字体颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = ColorWithRGB(95,95,95);
    attrs[NSFontAttributeName]=[UIFont fontWithName:@"PingFangSC-Regular" size:10];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =ColorWithRGB(180,35,37);
    selectedAttrs[NSFontAttributeName]=[UIFont fontWithName:@"PingFangSC-Regular" size:10];
    
    //通过appearance统一设置tabbarItem的样式
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
-(void)setChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage withTag:(NSInteger)tag{
    
    //设置文字和图片
    vc.navigationItem.title=title;
    vc.tabBarItem.title=title;
    vc.tabBarItem.tag=tag;
    
    vc.tabBarItem.image=[Tool getImageWithBoudleName:@"utilityImage" imgName:image];
    vc.tabBarItem.selectedImage=[Tool getImageWithBoudleName:@"utilityImage" imgName:selectedImage];
    //包装一个导航控制器，添加导航控制器为tabbarController的子控制器
    NavigationController *nav=[[NavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
   
    return YES;
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
   
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
