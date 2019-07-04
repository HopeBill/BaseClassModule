//
//  CTMediator+CTMediatorModuleAActions.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator+ModuleActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActiontabBarViewControllerOne = @"tabBarViewControllerOne";

@implementation CTMediator (ModuleActions)
-(UIViewController*)CTMediator_tabBarViewControllerOne{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetA action:kCTMediatorActiontabBarViewControllerOne params:@{@"key":@"value"} shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
    
}

- (void)CTMediator_cleanTableViewCellTarget
{
    [self releaseCachedTargetWithTargetName:kCTMediatorTargetA];
}

@end
