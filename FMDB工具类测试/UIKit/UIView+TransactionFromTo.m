//
//  UIView+TransactionFromTo.m
//  Pods
//
//  Created by guanxiaobai on 15/12/14.
//
//

#import "UIView+TransactionFromTo.h"

@implementation UIView (TransactionFromTo)

+ (void)animationFromView:(UIView *)fromView ToView:(UIView *)toView successBlock:(void (^)())successBlock
{
    UIView *pView = [[UIApplication sharedApplication] keyWindow];
    //获取cell主视图在当前view中的 frame
    CGRect cellRectInView =  [fromView.superview convertRect:fromView.frame toView:pView];
    
    //截图
    UIGraphicsBeginImageContext(cellRectInView.size);
    [fromView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView* cellImg = [[UIImageView alloc] initWithImage:img];
    cellImg.frame = cellRectInView;
    
    
    //定位起点
    CGPoint startPoint = [fromView.superview convertPoint:fromView.center toView:pView];
    
    //定位终点
    CGRect toRectInView = [toView.superview convertRect:toView.frame toView:pView];
    CGPoint endPoint = CGPointMake(toRectInView.origin.x + toRectInView.size.width / 2, toRectInView.origin.y + toRectInView.size.height / 2);
    
    //创建动画路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    
    //计算时间
    CGFloat fabX = fabs(fabs(endPoint.x) - fabs(startPoint.x));
    CGFloat fabY = fabs(fabs(endPoint.y) - fabs(startPoint.y));
    CGFloat distance = sqrtf(powf(fabX, 2.0) + powf(fabY, 2));
    CGFloat pathVelocity = 1000;
    
    //开始动画
    float duration = (float)distance / (float)pathVelocity;
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    [CATransaction setCompletionBlock:^{
        CGPathRelease(path);
        [cellImg removeFromSuperview];
        if (successBlock) successBlock();
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:cellImg];
    CAKeyframeAnimation *pathTransAnimatin = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathTransAnimatin.path = path;
    pathTransAnimatin.duration = duration;
    pathTransAnimatin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [cellImg.layer addAnimation:pathTransAnimatin forKey:@"pathTransAnimatin"];
    
    [CATransaction commit];
}


@end
