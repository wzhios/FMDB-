//
//  NSString+Convert.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)

/**
 json字符串转换成cocoa数据结构
 
 @return 返回cocoa数据结构
 
 */
- (id)jsonValue;

@end
