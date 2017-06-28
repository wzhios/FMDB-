//
//  NSObject+Perform.h
//  DictPublishAssistant
//
//  Created by zhuwei on 15/3/6.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Perform)

- (void)performSelectorAlongChain:(SEL)sel;
- (void)performSelectorAlongChainReversed:(SEL)sel;

- (void)performMsgSendWithTarget:(id)target sel:(SEL)sel signal:(id)signal;
- (BOOL)performMsgSendWithTarget:(id)target sel:(SEL)sel;

@end
