//
//  ViewController.m
//  FMDB工具类测试
//
//  Created by 汪泽煌 on 16/9/18.
//  Copyright © 2016年 汪泽煌. All rights reserved.
//

#import "ViewController.h"

#import "ZWInjector.h"
#import "ZWORMDemo.h"
#import "FMDB.h"
#import "ZWPath.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    FMDatabase *db = [[FMDatabase alloc] initWithPath:[[ZWPath new] pathForDocumentRelativePath:@"test.sqlite"]];
    
    [db open];
    
    // 通过FMDB对象设置ORM
    [[ZWORMManager sharedInstance] setDefaultDatabase:db];
    
    
    //写入数据库
    for (int i = 0; i < 200; i ++) {
        ZWORMDemo *demo = [ZWORMDemo new];
        demo.uid = @(500 + i);
        demo.username = @"zhangsan";
        [demo save];
    }
    
    
    //数据库查询
    ZWORMDemo *demo = (ZWORMDemo *)[ZWORMDemo modelWhere:@"uid = :uid" parameters:@{@"uid":@"600"}];
    NSLog(@"demo:%@",demo);
    
    [db close];

}



@end
