//
//  ZWView.m
//  DictPublishAssistant
//
//  Created by zhuwei on 15/3/11.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "ZWView.h"
#import "NSObject+Perform.h"

@implementation ZWView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self execSetupMethod];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self execSetupMethod];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self execSetupMethod];
    }
    return self;
}

- (void)setup {
    
}

- (void)execSetupMethod {
    NSString* setupMethodString = @"setup";
    SEL setupMethod = NSSelectorFromString(setupMethodString);
    if(setupMethod && [self respondsToSelector:setupMethod]) {
        [self setup];
    }
}

@end
