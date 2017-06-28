//
//  UIImage+ImageScale.h
//  Pods
//
//  Created by guanxiaobai on 15/12/2.
//
//

#import <UIKit/UIKit.h>

/**
 *  zoom in or out image with specified height
 */

@interface UIImage (ImageScale)

/**
 *  zoom in or out image with specified height
 *
 *  @param image the image
 *  @param height the the heigth of the image
 *
 *  @return the size after zoom
 */
+ (CGSize)sizeForImage:(UIImage *)image withSpecifiedHeight:(CGFloat)height;

@end
