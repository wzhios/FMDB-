//
//  ZWViewModelViewController.h
//  DictPublishAssistant
//
//  Created by zhuwei on 15/7/1.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import "ZWBundleViewController.h"

#undef	INTERFACE_VIEWMODEL
#define INTERFACE_VIEWMODEL( __class ) \
@property (strong, nonatomic) __class* viewModel;

#undef	IMPLEMENTATION_VIEWMODEL
#define IMPLEMENTATION_VIEWMODEL( __class ) \
- (void)setupViewModel \
{ \
    self.viewModel = [[__class alloc] init]; \
} \

@interface ZWViewModelViewController : ZWBundleViewController

@end
