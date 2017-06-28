//
//  UIImage+UIImage_BorderColor.m
//  Pods
//
//  Created by zhuwei on 15/7/1.
//
//

#import "UIImage+BorderColor.h"

@implementation UIImage (BorderColor)

/**
 *  获取扁平化的按钮
 *
 *  @param size        图片大小
 *  @param fillColor   填充色
 *  @param borderColor 边界颜色
 *  @param borderWidth 边界宽度
 *
 *  @return 返回图片
 */
+ (UIImage *)borderColorImageWithSize:(CGSize)size
                            fillColor:(UIColor *)fillColor
                          borderColor:(UIColor *)borderColor
                          borderWidth:(CGFloat)borderWidth {
        UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
        if(borderColor && borderWidth > 0) {
            [borderColor set];
            UIRectFill(CGRectMake(0, 0, size.width, size.height));
        }
        if(fillColor) {
            [fillColor set];
            UIRectFill(CGRectMake(borderWidth, borderWidth, size.width - borderWidth * 2, size.height - borderWidth * 2));
        }
        UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return pressedColorImg;
}

@end
