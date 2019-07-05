//
//  UIImage+Tool.m
//  Example
//
//  Created by Bill on 4/7/2019.
//  Copyright © 2019 Bill. All rights reserved.
//

#import "UIImage+Tool.h"
@interface PodFakeClass : NSObject
@end
@implementation PodFakeClass
@end


@implementation UIImage (Tool)
+ (instancetype)getImgName:(NSString *)imageName withBundle:(NSString *)bundleName{

    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:[PodFakeClass class]];
    NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
  
    NSURL *url = [currentBundle URLForResource:bundleName withExtension:@"bundle"];
    if (url) {
        NSBundle *targetBundle = [NSBundle bundleWithURL:url];
        UIImage *image = [UIImage imageNamed:name
                                    inBundle:targetBundle
               compatibleWithTraitCollection:nil];
        return image;
    }else{
        return [UIImage imageNamed:name];
    }
    
    
}

@end
