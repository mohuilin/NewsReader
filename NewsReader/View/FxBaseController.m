//
//  FxBaseController.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "FxBaseController.h"
#import "FxActivityIndicator.h"

@implementation FxBaseController


- (void)dealloc
{
    [_operation cancelOp];
    _operation = nil;
}

- (void)opFail:(NSString *)errorMessage
{
    BASE_ERROR_FUN(errorMessage);
    [self showIndicator:errorMessage autoHide:YES afterDelay:YES];
}

- (void)opSuccess:(id)data
{
    [self hideIndicator];
}

#pragma mark - Activity methods

- (FxActivity *)showActivityInView:(UIView *)view
{
    FxActivity * activity = [[FxActivityIndicator alloc] initWithView:view];
    CGRect frame = view.bounds;
    
    activity.frame = frame;
    [view addSubview:activity];
    activity.labelText = @"";
    
    return activity;
}

- (void)showIndicator:(NSString *)tipMessage
             autoHide:(BOOL)hide
           afterDelay:(BOOL)delay
{
    if (_activity == nil) {
        _activity = [self showActivityInView:self.view];
    }
    
    if (tipMessage != nil) {
        _activity.labelText = tipMessage;
        [_activity show:NO];
    }
    
    if (hide && _activity.alpha>=1.0) {
        if (delay)
            [_activity hide:YES afterDelay:AnimationSecond];
        else
            [_activity hide:YES];
    }
}

- (void)hideIndicator
{
    [_activity hide:YES];
}

@end
