//
//  FxLogin.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "FxLogin.h"
#import "UserInfo.h"

@implementation FxLogin

- (void)parseSuccess:(NSDictionary *)dict jsonString:(NSString *)jsonString{
    NSDictionary *dictDate = [dict objectForKey:NetData];
    UserInfo *info = [UserInfo infoFromDict:dictDate];
    [_delegate opSuccess:info];
}

@end
