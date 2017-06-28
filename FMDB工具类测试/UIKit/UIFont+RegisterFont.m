//
//  UIFont+RegisterFont.m
//  Pods
//
//  Created by guanxiaobai on 15/11/30.
//
//

#import "UIFont+RegisterFont.h"

#import <CoreText/CoreText.h>

@implementation UIFont (RegisterFont)

/**
 *  register font with specified path
 *
 *  @param fontPath the font resource path of .ttf
 */
+ (void)registerFontWithFontName:(NSString *)fontName inBundle:(NSBundle *)bundle
{
    NSURL *fontURL = [bundle URLForResource:fontName withExtension:@".ttf"];
    NSString *e = [NSString stringWithFormat:@"you must provide %@.ttf", fontName];
    NSAssert(fontURL != nil, e);
    CFErrorRef error;
    CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeNone, &error);
}

@end
