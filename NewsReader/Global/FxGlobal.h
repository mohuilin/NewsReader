//
//  FxGlobal.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FxGlobal : NSObject


+ (FxGlobal *)global;

// 系统版本
+ (BOOL)isSystemLowIOS8;
+ (BOOL)isSystemLowIOS7;
+ (BOOL)isSystemLowiOS6;
+ (NSString *)clientVersion;

// 缓存路径
+ (NSString *)getRootPath;
+ (NSString *)getCacheImage:(NSString *)fileName;
+ (NSString *)getUserDBFile;
+ (BOOL)setNotBackUp:(NSString *)filePath;

// 系统提示
+ (void)alertMessage:(NSString *)message;
+ (void)alertMessageEx:(NSString *)message
                 title:(NSString *)title
              okTtitle:(NSString *)okTitle
           cancelTitle:(NSString *)cancelTitle
              delegate:(id)delegate;

// 退出
+ (void)logout;

@end
