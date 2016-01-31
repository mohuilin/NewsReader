//
//  HomePage.m
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import "HomePage.h"
#import "FxJsonUtility.h"
#import "ColumnInfo.h"
#import "FxOperation.h"
#import "FxGetAdvert.h"
#import "AdvertInfo.h"

@interface HomePage ()<FxOperationDelegate>

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testOperation];
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

- (void)testModel{
    NSURL *url = [NSURL URLWithString:ColumnURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    BASE_INFO_FUN(json);
    NSDictionary *dict = [FxJsonUtility jsonValueFromString:json];
    NSArray *infos = [ColumnInfo arrayFromDict:dict];
    
    //排序
    infos = [infos sortedArrayUsingSelector:@selector(compare:)];
    
    for (ColumnInfo *info in infos) {
        BASE_INFO_FUN(info.ID);
        BASE_INFO_FUN(info.name);
    }
    
    //比较
    BaseInfo *info1 = [infos objectAtIndex:0];
    BaseInfo *info2 = [infos objectAtIndex:1];
    if ([info1 isEqual:info2]) {
        BASE_INFO_FUN(@"equal");
    }else{
        BASE_INFO_FUN(@"not equal");
    }
}

- (void)testOperation{
    
    BASE_INFO_FUN(AdvertURL);
    NSString *url = AdvertURL;
    NSDictionary *dict = @{@"url":url,@"data":@""};
    FxOperation *operation = [[FxGetAdvert alloc] initWithDelegate:self opInfo:dict];
    [operation executeOp];
}

#pragma mark -FxOperationDelegate
- (void)opSuccess:(AdvertInfo *)data{
    BASE_INFO_FUN(data.name);
}

- (void)opFail:(NSString *)errorMessage{
    BASE_ERROR_FUN(errorMessage);
}

@end
