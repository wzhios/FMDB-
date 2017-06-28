//
//  NSData+Zip.h
//  Pods
//
//  Created by zhuwei on 15/11/19.
//
//

#import <Foundation/Foundation.h>

@interface NSData (Zip)

/**
 *  zip压缩数据
 *
 *  @return 返回压缩完的数据
 */
- (NSData *)zipData;

/**
 *  解压数据
 *
 *  @return 返回解压完的数据
 */
- (NSData *)unzipData;

@end
