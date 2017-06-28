//
//  UIView+ShotCutImage.m
//  DictPublishAssistant
//
//  Created by zhuwei on 15/5/13.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "UIView+ShotCutImage.h"

@implementation UIView (ShotCutImage)

- (UIImage *)shotCutImage {
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
