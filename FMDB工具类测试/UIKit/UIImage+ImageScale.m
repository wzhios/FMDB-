//
//  UIImage+ImageScale.m
//  Pods
//
//  Created by guanxiaobai on 15/12/2.
//
//

#import "UIImage+ImageScale.h"

@implementation UIImage (ImageScale)

+ (CGSize)sizeForImage:(UIImage *)image withSpecifiedHeight:(CGFloat)height
{
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    //宽高比
    CGFloat weight = imageWidth / imageHeight;
    
    return CGSizeMake(weight * height, height);
}

@end
