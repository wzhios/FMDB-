//
//  ZWViewModelViewController.m
//  DictPublishAssistant
//
//  Created by zhuwei on 15/7/1.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "ZWViewModelViewController.h"
//#import <ZWCommonKit/NSObject+Perform.h>
#import "NSObject+Perform.h"

@interface ZWViewModelViewController (PRIVATE)

@end

@implementation ZWViewModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SEL viewModelSel = NSSelectorFromString(@"setupViewModel");
    if([self respondsToSelector:viewModelSel]) {
        [self performSelectorAlongChain:viewModelSel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
