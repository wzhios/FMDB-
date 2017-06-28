//
//  ZWORMDemo.m
//  ZWCommonKit
//
//  Created by zhuwei on 16/8/15.
//  Copyright © 2016年 zhuwei. All rights reserved.
//

#import "ZWORMDemo.h"

@implementation ZWORMDemo


#pragma mark - 数据库表构建 -
/**
 *  初始化表的结构
 *
 *  @param db      数据库对象
 *  @param version 数据库表版本
 *
 *  @return 返回最新版本号
 */
- (NSInteger)setupTableWithDatabase:(FMDatabase *)db tableVersion:(NSInteger)version {
    
    if(db == nil) return 0;
    NSString* sql = @"create table if not exists    \
    user (                                          \
    uid             INTEGER                       , \
    username        TEXT                            \
    );";
    [db executeUpdate:sql];
    return 1;
}


/**
 构建数据库映射
 
 */
- (void)schema:(ZWORMTableMap *)table {
    [table setTableName:@"User"];
    [table setColumnName:@"uid" type:ZWORMColumnMapTypeInt isPrimaryKey:YES isIncrements:NO];
    [table setColumnName:@"username" type:ZWORMColumnMapTypeString];
}



@end
