//
//  AdvertPage.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "MMBasePage.h"
#import "ADLaunchImageView.h"

@interface AdvertPage : MMBasePage

@property (nonatomic,strong) ADLaunchImageView *adLaunchImageView;

+ (BOOL)canShowAdvertPage;
+ (void)showAdvertPage;

@end
