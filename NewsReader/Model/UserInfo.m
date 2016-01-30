//
//  UserInfo.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)infoFromDict:(NSDictionary *)dict{
    UserInfo *info = [[UserInfo alloc] init];
    
    info.ID = [dict objectForKey:@"id"];
    info.name = [dict objectForKey:@"name"];
    info.token = [dict objectForKey:@"token"];
    
    return info;
}

@end
