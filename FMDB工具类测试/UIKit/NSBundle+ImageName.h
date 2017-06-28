//
//  NSBundle+ImageName.h
//  Pods
//
//  Created by zhuwei on 15/12/29.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (ImageName)


/**
 *  通过图片名称获取图片资源
 *
 *  @param imgName 图片名称
 *
 *  @return 图片对象
 */
- (UIImage *)imageWithName:(NSString *)imgName;

@end
