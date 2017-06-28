//
//  NSDate+Format.m
//  DictPublishAssistant
//
//  Created by zhuwei on 15/2/27.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//


#import "NSDate+Format.h"

@implementation NSDate (Format)

/**
 通过format格式返回日期字符串
 
 */
- (NSString *)stringDateWithFormat:(NSString *)format {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end
