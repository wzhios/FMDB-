//
//  NSData+Zip.m
//  Pods
//
//  Created by zhuwei on 15/11/19.
//
//

#import "NSData+Zip.h"
#include "zlib.h"

#ifndef byte
#define byte unsigned char
#endif

#define _OUT
#define _IN

/**
 解压缩数据块
 
 @param zipData: 需要解压的数据块
 
 @param zipDataLength: 需要解压的数据块长度
 
 @param unzipBuffer: 解压后数据存储Buffer
 
 @param unzipBufferLength: 解压后数据存储Buffer的长度
 
 @return 返回值 大于0 标识成功解压后数据存储，解压失败返回 -1
 */
unsigned long unzip_data(_IN const byte* zipData,_IN unsigned int zipDataLength,_OUT byte* unzipBuffer,_IN unsigned int unzipBufferLength) {
    if(zipData == NULL || zipDataLength <= 0 || unzipBuffer == NULL || unzipBufferLength <= 0)
        return -1;
    /*
    bool done = false;
    int status;
    z_stream strm;
    strm.next_in = (Bytef *)zipData;
    strm.avail_in = zipDataLength;
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    if (inflateInit2(&strm, (15+32)) != Z_OK) return -1;
    while (!done) {
        if (strm.total_out > unzipBufferLength) {
            return -1;
        }
        strm.next_out = unzipBuffer + strm.total_out;
        strm.avail_out = unzipBufferLength - strm.total_out;
        status = inflate (&strm, Z_NO_FLUSH);
        if (status == Z_STREAM_END) {
            done = true;
        } else if (status != Z_OK) {
            break;
        }
        
    }
    if (inflateEnd (&strm) != Z_OK) return -1;
    return done ? strm.total_out : -1;
     */
    
    int err;
    z_stream d_stream; /* 解压流 */
    
    
    /* 这些个字段要在infalteInit之前初始化 */
    d_stream.zalloc = Z_NULL;
    d_stream.zfree = Z_NULL;
    d_stream.opaque = (voidpf)0;
    
    d_stream.next_in  = (Bytef*)zipData;  /* 设置输入缓冲区 */
    d_stream.avail_in = 0;
    d_stream.next_out = unzipBuffer;  /* 设置输出缓冲区 */
    
    /* 初始化解压流的状态 */
    err = inflateInit(&d_stream);
    if (inflateInit(&d_stream) != Z_OK) return -1;
    
    /* 只需一个循环：根据avail_in和avail_out，不停地调用inflate将输入缓冲区的数据
     解压，直到返回Z_STREAM_END，表示处理完全部输入并产生了全部的解压输出
     这里与flush参数是否为Z_FINISH无关
     */
    while (d_stream.total_out < unzipBufferLength && d_stream.total_in < zipDataLength) {
        d_stream.avail_in = d_stream.avail_out = 1; /* 强制小缓冲区 */
        err = inflate(&d_stream, Z_NO_FLUSH);
        if (err == Z_STREAM_END) break;
//        CHECK_ERR(err, "inflate");
    }
    
    err = inflateEnd(&d_stream);  /* 释放解压流的资源 */
//    CHECK_ERR(err, "inflateEnd");
    
    return d_stream.total_out;
}

/**
 *  压缩数据
 *
 *  @param sourceData           要压缩的原始数据
 *  @param sourceDataLength     原始数据长度
 *  @param zippedBuffer         压缩数据的临时缓存
 *  @param zippedBufferLength   压缩数据的缓存长度
 *
 *  @return 压缩失败小于0
 */
unsigned long zip_data(_IN const byte* sourceData,_IN unsigned int sourceDataLength,_OUT byte* zippedBuffer,_OUT unsigned int zippedBufferLength) {
    if(sourceData == NULL || sourceDataLength <= 0 || zippedBuffer == NULL || zippedBufferLength <= 0) {
        return -1;
    }
   /*
    
    bool done = false;
    int status;
    z_stream strm;
    
    strm.next_in = (Bytef *)sourceData;
    strm.avail_in = sourceDataLength;
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    if(deflateInit(&strm, Z_DEFAULT_COMPRESSION) != Z_OK) return -1;
    while (!done) {
        strm.next_out = zippedBuffer + strm.total_out;
        strm.avail_out = zippedBufferLength - strm.total_out;
                printf("strm.total_out:%d\n",strm.total_out);
                printf("strm.avail_in:%d\n",strm.avail_in);
                printf("strm.avail_out:%d\n",strm.avail_out);
                printf("------------\n");
        status = deflate(&strm, Z_FINISH);
                printf("strm.total_out:%d\n",strm.total_out);
                printf("strm.avail_in:%d\n",strm.avail_in);
                printf("strm.avail_out:%d\n",strm.avail_out);
                printf("status:%d\n",status);
        if(status == Z_STREAM_END) {
            done = true;
            break;
        } else if(status != Z_OK) {
            break;
        } else if(strm.avail_in == 0) {
            done = true;
            break;
        }
        
    }
    if(deflateEnd(&strm) != Z_OK) return -1;
    return done ? strm.total_out : -1;
    */
    z_stream c_stream; /* 压缩流 */
    int err;
    
    /* 这三个字段要在defalteInit之前初始化 */
    c_stream.zalloc = Z_NULL;
    c_stream.zfree = Z_NULL;
    c_stream.opaque = (voidpf)0;
    
    /* 初始化压缩流的状态，使用默认压缩级别 */
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    if(deflateInit(&c_stream, Z_DEFAULT_COMPRESSION) != Z_OK) return -1;
    
    /* 设置压缩操作的输入数据和输出缓冲区 */
    c_stream.next_in  = (Bytef*)sourceData;  /* 输入缓冲区指向输入字符串 */
    c_stream.next_out = zippedBuffer;
    
    /* 第一个循环：将flush设为Z_NO_FLUSH（表示还有输入数据未读完），将所有输入都读进去并进行压缩
     根据avail_in和avail_out，不停地调用deflate将输入缓冲区的数据压缩
     并写到输出缓冲区，直到输入字符串读完或输出缓冲区用完
     */
    while (c_stream.total_in != sourceDataLength && c_stream.total_out < zippedBufferLength) {
        c_stream.avail_in = c_stream.avail_out = 1; /* 强制小缓冲区 */
        err = deflate(&c_stream, Z_NO_FLUSH);
//        CHECK_ERR(err, "deflate");
    }
    /* 第二个循环：将flush设置为Z_FINISH，不再输入，让deflate()完成全部的压缩输出
     注意因为deflate压缩时可能是异步的（为了加速压缩，读取一次输入后不一定立刻就会产生压缩输出，
     可能读完K字节后才会产生输出），所以上一个循环可能还没产生全部输出，需要这个循环，让flush保持Z_FINISH
     （表示输入数据已读完），多次调用deflate()，直到返回Z_STREAM_END，表示处理完全部输入并产生了全部的压缩输出
     */
    for (;;) {  /* 完成压缩流的刷新，仍然强制小缓冲区 */
        c_stream.avail_out = 1;
        err = deflate(&c_stream, Z_FINISH);
        if (err == Z_STREAM_END) break;
//        CHECK_ERR(err, "deflate");
    }
    
    err = deflateEnd(&c_stream);  /* 释放压缩流的资源 */
//    CHECK_ERR(err, "deflateEnd");
    
    return c_stream.total_out;
}

@implementation NSData (Zip)

- (NSData *)zipData {
    
//    uLong comprLen;
//    uLong len = (uLong)[self length];
//    
//    void *compr = malloc(len);
//    int err;
//    err = compress((Bytef*)compr, &comprLen, (const Bytef*)[self bytes], len);
//    
//    NSData *resultData = [NSData dataWithBytes:compr length:comprLen];
//    free(compr);
    NSData *resultData = nil;
    byte* src = (byte *)[self bytes];
    unsigned int srcLen = [self length];
    unsigned int zippedBufLen = srcLen;
    byte* pZipBuf = (byte*)malloc(zippedBufLen * sizeof(byte));
    NSInteger dataLen = zip_data(src, srcLen,pZipBuf, zippedBufLen);
    if(dataLen > 0) {
        resultData = [NSData dataWithBytes:pZipBuf length:dataLen];
    }
    free(pZipBuf);
//
    return resultData;
}

- (NSData *)unzipData {
    
//    uLong len = (uLong)[self length];
//    uLong uncmprLen = 1024 * 400;
//    void *uncmpr = malloc(uncmprLen);
//    int err;
//    
//    err = uncompress((Bytef*)uncmpr, &uncmprLen, (const Bytef*)[self bytes], len);
//    
//    free(uncmpr);
    
    NSData *resultData = nil;
    unsigned int unzipBufLen = 1024 * 400;
    byte* pUnzipBuf = (byte*)malloc(unzipBufLen * sizeof(byte));
    byte* src = (byte *)[self bytes];
    unsigned int srcLen = [self length];
    NSInteger dataLen = unzip_data(src, srcLen,pUnzipBuf, unzipBufLen - 1);
    if(dataLen > 0) {
        resultData = [NSData dataWithBytes:pUnzipBuf length:dataLen];
    }
    free(pUnzipBuf);
    
    return resultData;
}

@end
