//
//  NavigationController.h
//  LKB
//
//  Created by lee on 16/5/17.
//  Copyright © 2016年 Libiyong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NavigationDelegate <NSObject>
@optional
-(void)leftBarButtonAction;
-(void)rightBarButtonAction;
@end

@interface NavigationController : UINavigationController
/**
 *左边返回按钮内容
 **/
@property(nonatomic,strong)NSString*leftBarTitle;
/**
 *左边返回按钮图片
 **/
@property(nonatomic,strong)NSString*leftBarImageName;
/**
 *右边返回按钮内容
 **/
@property(nonatomic,strong)NSString*rightBarTitle;
/**
 *右边返回按钮图片
 **/
@property(nonatomic,strong)NSString*rightBarImageName;
/**
 *右边返回按钮字体颜色
 **/
@property(nonatomic,strong)UIColor *rightBarTitleColor;
/**
 *导航栏标题颜色
 **/
@property(nonatomic,strong)UIColor *titileColor;
/**
 *导航栏背景颜色
 **/
@property(nonatomic,strong)UIColor *backgroundColor;
@property(nonatomic,weak)id<NavigationDelegate>navdelegate;

@end
