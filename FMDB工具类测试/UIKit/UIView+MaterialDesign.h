//
//  UIView+MaterialDesign.h
//  DictPublishAssistant
//
//  Created by zhuwei on 15/5/13.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MaterialDesign)

+ (void)inflateTransitionFromView:(UIView *)fromView
                           toView:(UIView *)toView
                    originalPoint:(CGPoint)originalPoint
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(void))block;

+ (void)deflateTransitionFromView:(UIView *)fromView
                           toView:(UIView *)toView
                    originalPoint:(CGPoint)originalPoint
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(void))block;
@end
