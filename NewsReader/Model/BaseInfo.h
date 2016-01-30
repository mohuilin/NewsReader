//
//  BaseInfo.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInfo : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *name;

+ (instancetype)infoFromDict:(NSDictionary *)dict;
+ (NSArray *)arrayFromDict:(NSDictionary *)dict;
+ (NSArray *)arrayFromArray:(NSArray *)array;

@end
