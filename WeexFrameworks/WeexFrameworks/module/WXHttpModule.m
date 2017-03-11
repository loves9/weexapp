//
//  WXHttpModule.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/10.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WXHttpModule.h"
#import <AFNetworking.h>

@implementation WXHttpModule

WX_EXPORT_METHOD(@selector(send:CallBack:))

- (void)send:(NSDictionary *)paramter CallBack:(WXModuleCallback)callback
{
    NSLog(@"%@", paramter[@"url"]);
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:paramter[@"url"] parameters:@"" progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
            NSLog(@"%@", [responseObject description]);
        callback(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
//    [manager POST:paramter[@"url"] parameters:@"" progress:^(NSProgress * _Nonnull uploadProgress) {
//        //
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //
//        NSLog(@"%@", [responseObject description]);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        //
//    }];
    
}
@end
