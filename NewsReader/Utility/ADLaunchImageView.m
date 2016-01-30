//
//  ADLaunchImageView.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "ADLaunchImageView.h"

@interface ADLaunchImageView ()

@property (nonatomic, weak) UIImageView *adImageView;

@end

@implementation ADLaunchImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addAdImageView];
        
        [self addSingleTapGesture];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        
        [self addAdImageView];
        
        [self addSingleTapGesture];
    }
    return self;
}

- (void)addAdImageView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    _adImageView = imageView;
}

- (void)addSingleTapGesture
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapGesture:)];
    [self addGestureRecognizer:singleTap];
}

#pragma maek - setter

- (void)setAdImage:(UIImage *)adImage{
    _adImage = adImage;
    _adImageView.alpha = 0.0;
    _adImageView.image = adImage;
    [UIView animateWithDuration:0.3 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _adImageView.alpha = 1.0;
    } completion:nil];
}

#pragma mark - action

- (void)singleTapGesture:(UITapGestureRecognizer *)recognizer
{
    if (self.clickedImageURLHandle) {
        self.clickedImageURLHandle(self.clickUrl);
    }
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden == NO && _adImageView.alpha > 0 && CGRectContainsPoint(_adImageView.frame, point)) {
        return self;
    }
    return nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _adImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*0.78);
}

@end
