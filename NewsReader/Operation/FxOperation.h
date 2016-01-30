//
//  FxOperation.h
//  NewsReader
//
//  Created by MoHuilin on 16/1/30.
//  Copyright © 2016年 MoHuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FxOperationDelegate;

@interface FxOperation : NSObject
{
    id<FxOperationDelegate> _delegate;
    NSURLConnection         *_connection; //连接
    NSMutableData           *_receiveData;//接受的数据
    NSInteger               _statusCode;//状态码
    long long               _totalLength; //数据的长度
    
@public
     NSDictionary            *_opInfo; //发送请求时传递的参数
}

- (id)initWithDelegate:(id<FxOperationDelegate>)delegate
                opInfo:(NSDictionary *)opInfo;
- (NSMutableURLRequest *)urlRequest;
- (void)executeOp;
- (void)cancelOp;
- (void)parseData:(id)data;
- (void)parseSuccess:(NSDictionary *)dict jsonString:(NSString *)jsonString;
- (void)parseFail:(id)dict;
- (void)parseProgress:(long long)receivedLength;
- (NSTimeInterval)timeoutInterval;

@end


/**
 *  回调，当连接完成后，成功或失败，告诉代理
 */
@protocol FxOperationDelegate <NSObject>

- (void)opSuccess:(id)data;
- (void)opFail:(NSString *)errorMessage;

@optional
- (void)opSuccessEx:(id)data opinfo:(NSDictionary *)dictInfo;
- (void)opFailEx:(NSString *)errorMessage opinfo:(NSDictionary *)dictInfo;
- (void)opSuccessMatch:(id)data;
- (void)opUploadSuccess;
@end
