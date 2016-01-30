//
//  HomePage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "HomePage.h"

@interface HomePage ()

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testDeviceSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testDeviceSize{
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (IsiPhone6P) {
        FxLog(@"IsiPhone6P :%f,%f",size.width,size.height);
    }
    if (IsiPhone6) {
        FxLog(@"IsiPhone6 :%f,%f",size.width,size.height);
    }
    if (IsiPhone5) {
        FxLog(@"IsiPhone5 :%f,%f",size.width,size.height);
    }
    if (IsiPhone4) {
        FxLog(@"IsiPhone4 :%f,%f",size.width,size.height);
    }
}

@end
