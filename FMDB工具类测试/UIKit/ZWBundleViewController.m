//
//  ZWBundleViewController.m
//  DictPublishAssistant
//
//  Created by zhuwei on 15/7/3.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "ZWBundleViewController.h"
//#import <ZWCommonKit/NSObject+Perform.h>
#import "NSObject+Perform.h"
#import "NSBundle+ImageName.h"

@implementation ZWBundleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bundleName = nil;
    self.bundle = [NSBundle mainBundle];
    
    SEL setupBundleSel = NSSelectorFromString(@"setupBundle");
    if([self respondsToSelector:setupBundleSel]) {
        [self performSelectorAlongChainReversed:setupBundleSel];
    }
}

- (NSString *)localStringForKey:(NSString *)key {
    if (_bundleName == nil) {
        return [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil];
    }
    return [self.bundle localizedStringForKey:key value:@"" table:nil];
}
- (UIImage *)imageWithName:(NSString *)imgName {
    if(_bundleName == nil) {
        return [UIImage imageNamed:imgName];
    } else {
        return [self.bundle imageWithName:imgName];
    }
}

@end
