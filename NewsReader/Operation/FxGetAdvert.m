//
//  FxGetAdvert.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "FxGetAdvert.h"
#import "AdvertInfo.h"

@implementation FxGetAdvert

- (void)parseSuccess:(NSDictionary *)dict jsonString:(NSString *)jsonString{
    NSDictionary *dictDate = [dict objectForKey:NetData];
    AdvertInfo *info = [AdvertInfo infoFromDict:dictDate];
    [_delegate opSuccess:info];
}

@end
