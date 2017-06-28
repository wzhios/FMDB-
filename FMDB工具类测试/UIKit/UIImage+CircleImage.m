//
//  UIImage+CircleImage.m
//  Pods
//
//  Created by zhuwei on 15/7/8.
//
//

#import "UIImage+CircleImage.h"

@implementation UIImage (CircleImage)


+ (UIImage *)circleImageWithIcon:(UIImage *)icon imageSize:(CGSize)imageSize fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    
    int w = imageSize.width * [UIScreen mainScreen].scale;
    int h = imageSize.height * [UIScreen mainScreen].scale;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    
    //绘制圆形正文
    CGContextBeginPath(context);
    if(fillColor) {
        CGContextSetFillColorWithColor(context, fillColor.CGColor);
    }
    if(borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    }
    if(borderWidth > 0) {
        CGContextSetLineWidth(context, borderWidth * [UIScreen mainScreen].scale);
    }
    
    CGContextAddArc(context, w / 2, h / 2, (w - borderWidth * 2) / 2, 0, 360, 0);
    
    if(borderWidth > 0) {
        CGContextDrawPath(context, kCGPathFillStroke);
        CGContextSetLineWidth(context, borderWidth);
    } else {
        CGContextDrawPath(context, kCGPathFill);
    }
    CGContextDrawPath(context, kCGPathFill);
    
    
    
    //绘制icon
    if(icon) {
        CGImageRef iconRef = icon.CGImage;
        float iconWidth = CGImageGetWidth(iconRef);
        float iconHeight = CGImageGetHeight(iconRef);
        CGContextDrawImage(context, CGRectMake((w - iconWidth) / 2, (h - iconHeight) / 2, iconWidth, iconHeight), iconRef);
    }
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage* img = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return img;
}
@end
