//
//  AdvertPage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "AdvertPage.h"
#import "FxDate.h"
#import "UIImage+LaunchImage.h"
#import "FxGlobal.h"
#import "FxFileUtility.h"
#import "AppDelegate.h"
#import "FxGetImage.h"
#import "FxAppSetting.h"

@interface AdvertPage ()

@end

@implementation AdvertPage

+ (BOOL)canShowAdvertPage
{
    NSString *dateString = [FxAppSetting getValue:AdvertKey];
    NSDate *date = [FxDate dateFromStringYMDHMS:dateString];
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];
    
    //一小时之内不再显示启动图
    if (interval < AdvertCheckTime) {
        return NO;
    }
    
    return YES;
}

+ (void)showAdvertPage
{
    [FxAppSetting setValue:[FxDate stringFromDateYMDHMS:[NSDate date]] forKey:AdvertKey];
    
    AdvertPage *controller = [[AdvertPage alloc] init];
    UIWindow *window = [AppDelegate appDeg].window;
    
    if (window.rootViewController != nil) {
        CGRect frame = window.rootViewController.view.bounds;
        
        controller.view.frame = frame;
        [window.rootViewController.view addSubview:controller.view];
    }
    else {
        window.rootViewController = controller;
        [window makeKeyAndVisible];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.adLaunchImageView];
    [self getAdvertImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)getAdvertImage{
    // 本地已经存在，取本地图片
    if ([self checkLanchExist]) {
        return;
    }
    
    [self getAdvertOp];
}

- (void)getAdvertOp
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSString *url = [NSString stringWithFormat:AdvertURL, (long)size.width, (long)size.height];
    self.adLaunchImageView.clickUrl = url;
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[FxOperation alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (BOOL)checkLanchExist
{
    NSString *fileName = [FxDate stringFromDateYMD:[NSDate date]];
    NSString *filePath = [FxGlobal getCacheImage:fileName];
    
    if ([FxFileUtility isFileExist:filePath]) {
        self.adLaunchImageView.adImage = [UIImage imageWithContentsOfFile:filePath];
        [self delayHideAdvert];
        return YES;
    }
    
    return NO;
}

- (void)delayHideAdvert
{
    [self performSelector:@selector(hideLanch) withObject:nil afterDelay:AdvertDelayTime];
}

- (void)hideLanch
{
    if (self.view.superview != [AppDelegate appDeg].window) {
        [self.view removeFromSuperview];
    }
    else
        [[AppDelegate appDeg] showHomePage];
}

- (ADLaunchImageView *)adLaunchImageView{
    if (!_adLaunchImageView) {
//        __typeof(self) __weak weakSelf = self;
        __weak __typeof(&*self)weakSelf = self;
        _adLaunchImageView = [[ADLaunchImageView alloc] initWithImage:[UIImage getLaunchImage]];
        [_adLaunchImageView setClickedImageURLHandle:^(NSString *clickUrl) {
            BASE_INFO_LOG([weakSelf class], _cmd, clickUrl);
        }];
    }
    return _adLaunchImageView;
}

#pragma mark - FxOperationDelegate methods

- (void)opSuccess:(NSDictionary *)dict
{
    NSDictionary *dictData = [dict objectForKey:NetData];
    NSString *url = [dictData objectForKey:@"imageurl"];
    
    [self getLaunchImageOp:url];
}

- (void)getLaunchImageOp:(NSString *)url
{
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[FxGetImage alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)opSuccessEx:(id)data opinfo:(NSDictionary *)dictInfo
{
    [self setLaucnImage:data];
    [self delayHideAdvert];
}

- (void)setLaucnImage:(NSData *)data
{
    NSString *fileName = [FxDate stringFromDateYMD:[NSDate date]];
    UIImage *image = [UIImage imageWithData:data];
    
    if (image!=nil) {
        self.adLaunchImageView.adImage = image;
        [data writeToFile:[FxGlobal getCacheImage:fileName] atomically:YES];
    }
}

@end
