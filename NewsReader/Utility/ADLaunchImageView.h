//
//  ADLaunchImageView.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADLaunchImageView : UIImageView

@property (nonatomic, strong) UIImage *adImage;
@property (nonatomic, copy) NSString *clickUrl;

@property (nonatomic, copy) void (^clickedImageURLHandle)(NSString * clickUrl);

@end
