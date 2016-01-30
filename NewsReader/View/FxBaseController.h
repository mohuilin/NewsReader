//
//  FxBaseController.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FxOperation.h"
#import "FxActivity.h"

@interface FxBaseController : UIViewController<FxOperationDelegate>{
    FxOperation  *_operation;
    FxActivity   *_activity;
}

- (void)showIndicator:(NSString *)tipMessage
             autoHide:(BOOL)hide
           afterDelay:(BOOL)delay;
- (void)hideIndicator;

@end
