//
//  UIImage+CornerIcon.m
//  Pods
//
//  Created by zhuwei on 16/1/7.
//
//

#import "UIImage+CornerIcon.h"

@implementation UIImage (CornerIcon)


/**
 *  生成角标图片
 *
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *  @param icon        角标图标
 *  @param direction   角标所处位置
 *
 *  @return 返回角标图片
 */
- (UIImage *)cornerIconImageWithBorderWidth:(float)borderWidth
                                borderColor:(UIColor *)borderColor
                                 cornerIcon:(UIImage *)icon
                        cornerIconDirection:(UIImageCornerIconDirection)direction {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef effectInContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(effectInContext, 1.0, -1.0);
    CGContextTranslateCTM(effectInContext, 0, -self.size.height);
    CGContextDrawImage(effectInContext, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    CGContextSetStrokeColorWithColor(effectInContext, borderColor.CGColor);
    CGContextSetLineWidth(effectInContext, borderWidth);
    
    CGContextMoveToPoint(effectInContext, self.size.width, self.size.width - borderWidth);
    
    
//    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    
//    UIRectFill(bounds);
    
    //Draw the tinted image in context
//    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
//    if (blendMode != kCGBlendModeDestinationIn) {
//        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
//    }
    
    
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outImage;
}

@end
