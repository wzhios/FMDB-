//
//  NSString+MD5.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 NSString MD5 扩展
 
 */

@interface NSString (MD5)

/**
 返回MD5加密后的字符串
 
 @return NSString类型
 */
- (NSString *)md5;

@end
