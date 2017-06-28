//
//  NSData+Convert.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSData+Convert.h"

@implementation NSData (Convert)

/**
 转换成cocoa数据结构
 
 @return 返回cocoa数据结构
 
 */
- (id)jsonValue {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableLeaves error:nil];
}

/**
 字符串转换
 
 */
- (NSString *)stringValue {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

/**
 返回NSDictionary
 
 */
- (NSDictionary *)dictionaryValue {
    NSKeyedUnarchiver *unarchiver = nil;
    @try {
        unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:self];
    }
    @catch (NSException *exception) {
        
    }
    if(!unarchiver) return nil;
    NSDictionary *dictionary = [unarchiver decodeObjectForKey:@"key"];
    [unarchiver finishDecoding];

    return dictionary;
}

@end
