//
//  FxBaseController.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "FxBaseController.h"

@implementation FxBaseController


- (void)dealloc
{
    [_operation cancelOp];
    _operation = nil;
}

- (void)opFail:(NSString *)errorMessage
{
    BASE_ERROR_FUN(errorMessage);
}

- (void)opSuccess:(id)data
{
    
}

@end
