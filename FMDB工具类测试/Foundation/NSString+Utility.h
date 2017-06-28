//
//  NSString+Utility.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 字符类型枚举
 
 */
typedef NS_ENUM(NSUInteger, DCCharacterType) {
    DCCharacterTypeOther,           //其他字符
    DCCharacterTypeChinese,         //中文字符
    DCCharacterTypeSymbol           //符号字符
};

@interface NSString (Utility)

/**
 获得字符下标的字符类型
 
 @param index: 字符下标
 
 @return DCCharacterType类型
 */
- (DCCharacterType)characterTypeAtIndex:(NSUInteger)index;

/**
 判断字符串是否为数字
 
 @return BOOL类型
 */
- (BOOL)isNumberString;

/**
 判断字符串是否是字母字符串
 
 return BOOL
 */
- (BOOL)isLetterString;

/**
 判断字符串是否是手机格式
 
 @return BOOL类型
 */
- (BOOL)isPhoneString;

/**
 判断字符串是否是邮箱格式
 
 @return BOOL类型
 */
- (BOOL)isEMailString;

/**
 判断是否是中文字符串
 
 */
- (BOOL)isChineseString;

/**
 首字母大写其他保持不变
 
 */
- (NSString *)capitalizedOriginalString;

/**
 *  只转换ascii码的大小写
 *
 *  @return 返回转换后的字符串
 */
- (NSString *)lowerLetterString;

/**
 *  获取中文字符串的发音
 *
 *  @param stripDiacritics 是否显示声调
 *
 *  @return 返回发音
 */
- (NSString *)zhCNPhoneticWithStripDiacritics:(BOOL)stripDiacritics;
@end
