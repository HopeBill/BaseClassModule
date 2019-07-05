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
-(UIViewController*)Action_tabBarViewControllerOne:(NSDictionary *)params{
    OneViewController *VC=[[OneViewController alloc] init];
    
    
    return VC;
}

@end
