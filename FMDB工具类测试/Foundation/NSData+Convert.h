//
//  NSData+Convert.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Convert)

/**
 转换成cocoa数据结构
 
 @return 返回cocoa数据结构
 
 */
- (id)jsonValue;

/**
 字符串转换
 
 */
- (NSString *)stringValue;

/**
 返回NSDictionary
 
 */
- (NSDictionary *)dictionaryValue;

@end
