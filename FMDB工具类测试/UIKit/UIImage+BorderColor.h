//
//  UIImage+UIImage_BorderColor.h
//  Pods
//
//  Created by zhuwei on 15/7/1.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (BorderColor)

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
                          borderWidth:(CGFloat)borderWidth;
@end
