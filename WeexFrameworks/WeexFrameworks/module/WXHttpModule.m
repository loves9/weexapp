//
//  WXHttpModule.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/10.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WXHttpModule.h"
#import <AFNetworking.h>

@interface WXHttpModule()

@end

@implementation WXHttpModule
{
    AFHTTPSessionManager * _manager;
}

WX_EXPORT_METHOD(@selector(send:CallBack:))

/**
 * // 参数
 * @defaultParameters {
 *    baseURL
 *    method
 *    headers
 *    params
 *    data
 *    timeout
 *    requestType
 *    responseType
 *    transformRequest
 *    transformResponse
 *}
 *
 * // 回调
 * @callback
 */
- (void)send:(NSDictionary *)defaultParameters CallBack:(WXModuleCallback)callback
{
    NSLog(@"%@", defaultParameters[@"url"]);
    _manager=[AFHTTPSessionManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    

    if ([defaultParameters valueForKey:@"timeout"]) {
        [_manager.requestSerializer setTimeoutInterval:[[defaultParameters valueForKey:@"timeout"] intValue]];
    }
    
    if ([[defaultParameters valueForKey:@"responseType"] caseInsensitiveCompare:@"json"]) {
        [_manager.responseSerializer setAcceptableContentTypes:@"text/json"];
    }
    if([[defaultParameters valueForKey:@"method"] caseInsensitiveCompare:@"POST"] == NSOrderedSame){

        [_manager POST:defaultParameters[@"url"] parameters:defaultParameters[@"params"] progress:^(NSProgress * _Nonnull uploadProgress) {
            //
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //
            NSLog(@"%@", [responseObject description]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];
    }else{
        [_manager GET:defaultParameters[@"url"] parameters:defaultParameters[@"params"] progress:^(NSProgress * _Nonnull downloadProgress) {
            //
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //
            callback(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];

    }
    
}

- (void)cancel:(NSString *)tag
{
    _manager = nil;
}
@end
