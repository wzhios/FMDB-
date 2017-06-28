//
//  NSFileHandle+Utility.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileHandle (Utility)

/**
 获取文件大小
 
 @return 返回文件大小
 */
- (long long)fileSize;

/**
 文件的MD5值
 
 @param encryptKey: 加密的Key在数据最后用加密key进行MD5一次,如果为nil就不进行加密
 
 @param offset:     跳过多少个字节偏移量计算md5
 
 @return 返回文件的md5值，如果异常返回为nil
 */
- (NSString *)md5WithEncryptKey:(NSString *)encryptKey skipOffset:(NSUInteger)offset;

/**
 文件的MD5值
 
 @return 返回文件的md5值，如果异常返回为nil
 */
- (NSString *)md5;

@end
