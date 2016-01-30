//
//  NewsInfo.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "BaseInfo.h"

@interface NewsInfo : BaseInfo

@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *iconUrl;
@property (nonatomic,copy) NSString *contentUrl;

@end
