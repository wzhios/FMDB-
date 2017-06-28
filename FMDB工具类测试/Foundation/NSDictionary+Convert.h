//
//  NSDictionary+Convert.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Convert)

/**
 转换成NSData数据结构
 
 */
- (NSData *)dataValue;

/**
 转换成字符串字符串
 
 */
- (NSString *)jsonStringValue;

/**
 *  通过json文件加载json
 *
 *  @param path 文件路径
 *
 *  @return 返回数据对象
 */
+ (NSDictionary *)dictionaryWithJsonFilePath:(NSString *)path;

@end
