//
//  FxGetImage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "FxGetImage.h"

@implementation FxGetImage

- (void)parseData:(NSData *)data
{
    [_delegate opSuccessEx:data opinfo:_opInfo];
}

@end
