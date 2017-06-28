//
//  ZWBundleTableViewController.m
//  Pods
//
//  Created by zhuwei on 15/7/16.
//
//

#import "ZWBundleTableViewController.h"
//#import <ZWCommonKit/NSObject+Perform.h>
#import "NSObject+Perform.h"

@implementation ZWBundleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bundleName = nil;
    self.bundle = [NSBundle mainBundle];
    
    SEL setupBundleSel = NSSelectorFromString(@"setupBundle");
    if([self respondsToSelector:setupBundleSel]) {
        [self performSelectorAlongChain:setupBundleSel];
    }
}

- (NSString *)localStringForKey:(NSString *)key {
    return [self.bundle localizedStringForKey:key value:@"" table:nil];
}
- (UIImage *)imageWithName:(NSString *)imgName {
    if(_bundleName == nil) {
        return [UIImage imageNamed:imgName];
    } else {
        return [UIImage imageWithContentsOfFile:[self.bundle pathForResource:imgName ofType:@"png"]];
    }
}

@end
