//
//  NSString+Regex.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

/**
 通过正则表达式验证字符串格式
 
 @param regex: 正则表达式
 
 @return 返回是否搜索到字符串
 */
- (BOOL)isPassWithRegex:(NSString *)regex;

@end
