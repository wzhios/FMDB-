//
//  UIView+TransactionFromTo.h
//  Pods
//
//  Created by guanxiaobai on 15/12/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (TransactionFromTo)

+ (void)animationFromView:(UIView *)fromView ToView:(UIView *)toView successBlock:(void(^)())successBlock;

@end
