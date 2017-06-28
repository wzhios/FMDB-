//
//  UIFont+RegisterFont.h
//  Pods
//
//  Created by guanxiaobai on 15/11/30.
//
//

#import <UIKit/UIKit.h>

@interface UIFont (RegisterFont)

+ (void)registerFontWithFontName:(NSString *)fontName inBundle:(NSBundle *)bundle;

@end
