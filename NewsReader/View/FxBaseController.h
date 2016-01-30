//
//  FxBaseController.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FxOperation.h"

@interface FxBaseController : UIViewController<FxOperationDelegate>{
    FxOperation  *_operation;
}

@end
