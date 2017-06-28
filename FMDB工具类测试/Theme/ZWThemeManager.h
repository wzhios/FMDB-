//
//  ZWThemeManager.h
//  DictPublishAssistant
//
//  Created by zhuwei on 15/2/7.
//  Copyright (c) 2015年 zhuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 主题管理器
 
 */
@interface ZWThemeManager : NSObject


@end

#define _I(name)  \
([UIImage imageNamed:name])

#define _S(key, comment)  \
(NSLocalizedString(key, comment))