//
//  LoginPage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "LoginPage.h"
#import "FxLogin.h"
#import "UserInfo.h"

@implementation LoginPage

- (BOOL)checkVilidate{
    BOOL validate = YES;
    if (_userName.text.length <= 0 || _password.text.length <= 0) {
        validate = NO;
        [self showIndicator:LoginCheckTip autoHide:YES afterDelay:YES];
    }
    return validate;
}

- (IBAction)doLoginEvent:(id)sender{
    
    if (![self checkVilidate]) {
        return;
    }
    
    [self showIndicator:LoginingTip autoHide:NO afterDelay:NO];
    
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@",_userName.text,_password.text];
    NSDictionary *opInfo = @{@"url":LoginURL,
                             @"body":body};
    _operation = [[FxLogin alloc] initWithDelegate:self opInfo:opInfo];
    [_operation executeOp];
}

- (void)opSuccess:(UserInfo *)data{
    [super opSuccess:data];
    BASE_INFO_FUN(data.name);
    BASE_INFO_FUN(data.token);
}

- (void)opFail:(NSString *)errorMessage{
    BASE_ERROR_FUN(errorMessage);
}

@end
