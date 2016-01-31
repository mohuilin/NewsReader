//
//  UIImage+LaunchImage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "UIImage+LaunchImage.h"
//current window
#define tyCurrentWindow [[UIApplication sharedApplication].windows firstObject]
@implementation UIImage (LaunchImage)

// 引用自stackflow
+ (NSString *)getLaunchImageName
{
    //竖屏
    NSString *viewOrientation = @"Portrait";
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        viewOrientation = @"Landscape"; //横屏
    }
    NSString *launchImageName = nil;
    //读取系统的启动图片
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    CGSize viewSize = tyCurrentWindow.bounds.size;
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
}

+ (UIImage *)getLaunchImage
{
    return [UIImage imageNamed:[self getLaunchImageName]];
}


@end
