//
//  UIImage+Tool.h
//  Example
//
//  Created by Bill on 4/7/2019.
//  Copyright © 2019 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tool)

/**
  *name：图片的全名
 *bundle：包名
 **/
+ (instancetype)getImgName:(NSString *)imageName withBundle:(NSString *)bundleName;
@end

NS_ASSUME_NONNULL_END
