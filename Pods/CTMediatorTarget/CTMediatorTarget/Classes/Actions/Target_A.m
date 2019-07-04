//
//  Target_A.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "Target_A.h"

#import "OneViewController.h"

typedef void (^CTUrlRouterCallbackBlock)(NSDictionary *info);

@implementation Target_A
-(UIViewController*)Action_tabBarViewControllerOne{
    
    return [[OneViewController alloc] init];
}
-(UIViewController*)Action_tabBarViewControllerTwo{
     return [[OneViewController alloc] init];
}
-(UIViewController*)Action_tabBarViewControllerThree{
     return [[OneViewController alloc] init];
}
-(UIViewController*)Action_tabBarViewControllerFour{
     return [[OneViewController alloc] init];
}

@end
