//
//  NSData+AES256.h
//  CommonFramework
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

/**
 通过加密因子进行AES256加密
 
 @param key: 加密因子
 
 @return NSData类型
 */
- (NSData*)AES256EncryptWithKey:(NSString*)key;

/**
 通过加密因子进行AES256机密
 
 @param key: 加密因子
 
 @return NSData类型
 */
- (NSData*)AES256DecryptWithKey:(NSString*)key;

/**
 通过加密因子进行AES256机密
 
 @param key: 加密因子
 
 @return NSString类型
 */
- (NSString *)AES256DecryptStringWithKey:(NSString*)key;
@end
