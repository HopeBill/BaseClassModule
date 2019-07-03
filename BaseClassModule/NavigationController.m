//
//  NavigationController.m
//  LKB
//
//  Created by lee on 16/5/17.
//  Copyright © 2016年 Libiyong. All rights reserved.
//

#import "NavigationController.h"
#import "ResourceUtilityClass.h"

#define IS_IOS_VERSION_11 (([[[UIDevice currentDevice]systemVersion]floatValue] >= 11.0)? (YES):(NO))
@interface NavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *rightButton;
@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    //设置导航栏
    
    self.interactivePopGestureRecognizer.delegate =self;

}
//让手势生效
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    if(self.viewControllers.count <=1) {
        return NO;
    }
    return YES;
}

// 允许同时响应多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

//禁止响应手势的是否ViewController中scrollView跟着滚动
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer {
    return[gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     self.navigationController.interactivePopGestureRecognizer.enabled =YES;
}

-(void)initUI:(UIViewController*)viewController{
    
    
    //设置标题颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :ColorWithRGB(24,24,24),NSFontAttributeName:systemFont(17)}];
    
//    //设置导航栏
    UIImage *iamge1 = [Tool imageWithColor:ColorWithRGBA(255,255,255,1)];
    [self.navigationBar setBackgroundImage:iamge1 forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:iamge1];
    
    self.navdelegate=(id)viewController;
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    viewController.extendedLayoutIncludesOpaqueBars = YES;
    
     viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];

}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        // push过程中隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [self initUI:viewController];
    [super pushViewController:viewController animated:animated];
    
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
    
}
-(void)leftButtonAction{

    if (self.navdelegate && [self.navdelegate respondsToSelector:@selector(leftBarButtonAction)]) {
        [self.navdelegate leftBarButtonAction];
    }else{
         [self popViewControllerAnimated:YES];
    }
}
-(void)rightButtonAction{
    
    if (self.navdelegate && [self.navdelegate respondsToSelector:@selector(rightBarButtonAction)]) {
        [self.navdelegate rightBarButtonAction];
    }
}
-(void)setLeftBarTitle:(NSString *)leftBarTitle{
    _leftBarTitle=leftBarTitle;
     [self.leftButton setTitle:_leftBarTitle forState:UIControlStateNormal];
}
-(void)setLeftBarImageName:(NSString *)leftBarImageName{
    _leftBarImageName=leftBarImageName;
    [self.leftButton setImage:[UIImage imageNamed:_leftBarImageName] forState:UIControlStateNormal];
}
-(void)setRightBarTitle:(NSString *)rightBarTitle{
    _rightBarTitle=rightBarTitle;
    [self.rightButton setTitle:_rightBarTitle forState:UIControlStateNormal];
}
-(void)setRightBarImageName:(NSString *)rightBarImageName{
    _rightBarImageName=rightBarImageName;
     [self.rightButton setImage:[UIImage imageNamed:_rightBarImageName] forState:UIControlStateNormal];
}
-(void)setRightBarTitleColor:(UIColor *)rightBarTitleColor{
    _rightBarTitleColor=rightBarTitleColor;
    [self.rightButton setTitleColor:_rightBarTitleColor forState:UIControlStateNormal];
}
-(void)setTitileColor:(UIColor *)titileColor{
    _titileColor=titileColor;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :titileColor,NSFontAttributeName:systemFont(17)}];
}
-(void)setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor=backgroundColor;
    //    //设置导航栏
    UIImage *iamge1 = [Tool imageWithColor:backgroundColor];
    [self.navigationBar setBackgroundImage:iamge1 forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:iamge1];
}

-(UIButton*)leftButton{
    if (!_leftButton) {
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        button.frame =CGRectMake(0,0,44,44);
        button.titleLabel.font=[UIFont systemFontOfSize:13];
        [button setTitleColor:ColorWithRGB(24,24,24) forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _leftButton=button;
    }
    return _leftButton;
}
-(UIButton*)rightButton{
    if (!_rightButton) {
        UIButton*button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        button1.frame =CGRectMake(0,0,44,44);
        button1.titleLabel.font=[UIFont systemFontOfSize:15];
        [button1 setTitleColor:ColorWithRGB(24,24,24) forState:UIControlStateNormal];
        [button1 setTitle:@"" forState:UIControlStateNormal];
        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button1.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _rightButton=button1;
    }
    return _rightButton;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
