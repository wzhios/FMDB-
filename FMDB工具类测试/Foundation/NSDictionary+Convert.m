//
//  NSDictionary+Convert.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSDictionary+Convert.h"

@implementation NSDictionary (Convert)

/**
 转换成NSData数据结构
 
 */
- (NSData *)dataValue {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:@"key"];
    [archiver finishEncoding];
    return data;
}

/**
 转换成字符串
 
 */
- (NSString *)jsonStringValue {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if(jsonData) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/**
 *  通过json文件加载json
 *
 *  @param path 文件路径
 *
 *  @return 返回数据对象
 */
+ (NSDictionary *)dictionaryWithJsonFilePath:(NSString *)path {
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSError *err;
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&err];
}
@end
