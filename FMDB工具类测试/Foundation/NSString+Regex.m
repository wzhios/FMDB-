//
//  NSString+Regex.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)
/**
 通过正则表达式验证字符串格式
 
 @param regex: 正则表达式
 
 @return 返回是否搜索到字符串
 */
- (BOOL)isPassWithRegex:(NSString *)regex {
    NSRange   matchedRange = NSMakeRange(NSNotFound, 0UL);
    NSRegularExpression *regexObj = [NSRegularExpression regularExpressionWithPattern:regex
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    matchedRange = [regexObj rangeOfFirstMatchInString:self
                                               options:NSMatchingReportProgress
                                                 range:NSMakeRange(0, self.length)];
    return matchedRange.location != NSNotFound;
}
@end
