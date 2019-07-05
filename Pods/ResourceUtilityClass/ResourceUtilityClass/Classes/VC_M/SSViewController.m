//
//  ViewController.m
//  Example
//
//  Created by Bill on 2/7/2019.
//  Copyright © 2019 Bill. All rights reserved.
//

#import "SSViewController.h"


@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    ArrayJsonString
    
//    UIImage *imagev=[UIImage getImgWithName:@"icon_mess_deselect" bundle:@"TabBarImage" targetClass:[self class]];
    
    
}

- (UIImage *)getImageWithBoudleName:(NSString *)boudleName imgName:(NSString *)imgName {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:boudleName withExtension:@"bundle"];
    if (url) {
        NSBundle *targetBundle = [NSBundle bundleWithURL:url];
        UIImage *image = [UIImage imageNamed:imgName
                                    inBundle:targetBundle
               compatibleWithTraitCollection:nil];
        return image;
    }else{
        return [UIImage imageNamed:imgName];
    }
   
}

@end
