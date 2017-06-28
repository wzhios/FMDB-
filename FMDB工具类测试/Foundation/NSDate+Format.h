//
//  NSDate+Format.h
//  DictPublishAssistant
//
//  Created by zhuwei on 15/2/27.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)

/**
 通过format格式返回日期字符串
 
 */
- (NSString *)stringDateWithFormat:(NSString *)format;

@end
