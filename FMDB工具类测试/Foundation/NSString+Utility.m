//
//  NSString+Utility.m
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "NSString+Utility.h"
#import "NSString+Regex.h"

@implementation NSString (Utility)

/**
 获得字符下标的字符类型
 
 @param index: 字符下标
 
 @return DCCharacterType类型
 */
- (DCCharacterType)characterTypeAtIndex:(NSUInteger)index  {
    
    if(index >= self.length) return DCCharacterTypeSymbol;
    
    NSString* character = [self substringWithRange:NSMakeRange(index, 1)];
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* gbkData = [character dataUsingEncoding:gbkEncoding];
    
    if(gbkData.length < 2) {
        if(![character isNumberString] && ![character isLetterString]) {
            return DCCharacterTypeSymbol;
        }
        return DCCharacterTypeOther;
    }
    int highCode;
    int lowCode;
    [gbkData getBytes:&highCode range:NSMakeRange(0, 1)];
    [gbkData getBytes:&lowCode range:NSMakeRange(1, 1)];
    highCode = highCode & 0x0FF;
    lowCode = lowCode & 0x0FF;
    
    
    if (highCode == 0) {
        // 双字节3区 (汉字区)
        return DCCharacterTypeChinese;
    }
    if (highCode >= 0x81 && highCode <= 0xA0 && ((lowCode >= 0x40 && lowCode <= 0x7E) || (lowCode >= 0x80 && lowCode <= 0xFE))) {
        // 双字节4区 (汉字区)
        return DCCharacterTypeChinese;
    }
    if (highCode >= 0xAA && highCode <= 0xFE && ((lowCode >= 0x40 && lowCode <= 0x7E) || (lowCode >= 0x80 && lowCode <= 0xA0))) {
        // 双字节2区 (汉字区)
        return DCCharacterTypeChinese;
    }
    if (highCode >= 0xB0 && highCode <= 0xF7 && (lowCode >= 0xA1 && lowCode <= 0xFE)) {
        return DCCharacterTypeChinese;
    }
    if (highCode >= 0xA1 && highCode <= 0xA3) {
        return DCCharacterTypeSymbol;
    }
    return DCCharacterTypeOther;
}

/**
 判断字符串是否为数字
 
 @return BOOL类型
 */
- (BOOL)isNumberString {
    NSString *regexString  = @"^[0-9]*$";
    return [self isPassWithRegex:regexString];
}

/**
 判断字符串是否是字母字符串
 
 return BOOL
 */
- (BOOL)isLetterString {
    NSString *regexString  = @"^[a-zA-Z]*$";
    return [self isPassWithRegex:regexString];
}

/**
 判断字符串是否是手机格式
 
 @return BOOL类型
 */
- (BOOL)isPhoneString {
    NSString *regexString  = @"^[0-9]*$";
    return [self isPassWithRegex:regexString];
}

/**
 判断字符串是否是邮箱格式
 
 @return BOOL类型
 */
- (BOOL)isEMailString {
    NSString *regexString  = @"^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$";
    return [self isPassWithRegex:regexString];
}

/**
 判断是否是中文字符串
 
 */
- (BOOL)isChineseString {
    for (int i = 0; i < self.length; i ++) {
        if([self characterTypeAtIndex:i] == DCCharacterTypeChinese) {
            return YES;
        }
    }
    return NO;
}

/**
 首字母大写其他保持不变
 
 */
- (NSString *)capitalizedOriginalString {
    NSMutableString* str = [NSMutableString string];
    if(self.length == 0) {
        return str;
    }
    for (NSUInteger i = 0; i < self.length; i ++) {
        if(i == 0) {
            NSString *capitalizedChar = [[self substringToIndex:1] uppercaseString];
            [str appendString:capitalizedChar];
        } else {
            [str appendFormat:@"%c",[self characterAtIndex:i]];
        }
    }
    return str;
}

/**
 *  只转换ascii码的大小写
 *
 *  @return 返回转换后的字符串
 */
- (NSString *)lowerLetterString {
    NSMutableString *newStr = [NSMutableString string];
    for (NSInteger i = 0; i < self.length; i ++) {
        unichar ch = [self characterAtIndex:i];
        if(ch >= 'A' && ch <= 'Z') {
            [newStr appendFormat:@"%c",ch + ('a' - 'A')];
        } else {
            
            [newStr appendString:[NSString stringWithCharacters:&ch length:1]];
        }
    }
    return newStr;
}

/**
 *  获取中文字符串的发音
 *
 *  @param stripDiacritics 是否显示声调
 *
 *  @return 返回发音
 */
- (NSString *)zhCNPhoneticWithStripDiacritics:(BOOL)stripDiacritics {
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, stripDiacritics);
    return source;
}

@end
