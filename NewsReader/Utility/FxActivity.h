//
//  Fxactivity.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FxActivity : UIView

@property (copy) NSString *labelText;//提示文字
@property (copy) NSString *detailsLabelText;//详细提示文字

- (id)initWithView:(UIView *)view;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
