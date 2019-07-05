//
//  CTMediator+ModuleAActions.m
//  CTMediatorTarget_Example
//
//  Created by Bill on 4/7/2019.
//  Copyright © 2019 1255418023@qq.com. All rights reserved.
//

#import "CTMediator+ModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActiontabBarViewControllerOne = @"tabBarViewControllerOne";

@implementation CTMediator (ModuleAActions)

- (UIViewController *)CTMediator_tabBarViewControllerOne
{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetA action:kCTMediatorActiontabBarViewControllerOne params:@{@"key":@"value"} shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
