//
//  NSBundle+ImageName.m
//  Pods
//
//  Created by zhuwei on 15/12/29.
//
//

#import "NSBundle+ImageName.h"

@implementation NSBundle (ImageName)

- (UIImage *)imageWithName:(NSString *)imgName {
    if(imgName == nil) return nil;
    
    //当传入的图片直接带后缀，就直接访问图片路径
    NSString *imagePath = nil;
    if(
       [[imgName pathExtension] isEqualToString:@"jpg"]
       ) {
        imagePath = [self pathForResource:[NSString stringWithFormat:@"%@", imgName] ofType:nil];
        return [UIImage imageWithContentsOfFile:imagePath];
    }
    
    //处理png图片
    if (3.0 == [UIScreen mainScreen].scale) {
        imagePath = [self pathForResource:[NSString stringWithFormat:@"%@@3x", imgName] ofType:@"png"];
    }
    if (imagePath == nil) {
        imagePath = [self pathForResource:[NSString stringWithFormat:@"%@@2x", imgName] ofType:@"png"];
    }
    if (imagePath == nil) {
        imagePath = [self pathForResource:imgName ofType:@"png"];
    }
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
