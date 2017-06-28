//
//  NSString+Convert.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSString+Convert.h"

@implementation NSString (Convert)

/**
 json字符串转换成cocoa数据结构
 
 @return 返回cocoa数据结构
 
 */
- (id)jsonValue {
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if(data) {
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    }
    return nil;
}

@end
