//
//  UIImage+CircleImage.h
//  Pods
//
//  Created by zhuwei on 15/7/8.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (CircleImage)

+ (UIImage *)circleImageWithIcon:(UIImage *)icon imageSize:(CGSize)imageSize fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth;

@end
