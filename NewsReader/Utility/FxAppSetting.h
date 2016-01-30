//
//  FxAppSetting.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FxAppSetting : NSObject

+ (NSString *)getValue:(NSString *)key;
+ (void)setValue:(id)value forKey:(NSString *)key;

@end
