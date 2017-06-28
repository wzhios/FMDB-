//
//  UIImage+CornerIcon.h
//  Pods
//
//  Created by zhuwei on 16/1/7.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIImageCornerIconDirection) {
    UIImageCornerIconDirectionUpRight,
    UIImageCornerIconDirectionUpLeft,
    UIImageCornerIconDirectionDownRight,
    UIImageCornerIconDirectionDownLeft
};

/**
 *  角标图片生成器
 */
@interface UIImage (CornerIcon)

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
                        cornerIconDirection:(UIImageCornerIconDirection)direction;


@end
