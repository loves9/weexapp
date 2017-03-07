//
//  WeexManager.m
//  WeexLibrary
//
//  Created by LKLFS on 2017/3/2.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WeexManager.h"
#import <WeexSDK/WeexSDK.h>
#import "WXStreamModule.h"
//#import "WXEventModule.h"
#import "WXNavigationDefaultImpl.h"
//#import "WXImgLoaderDefaultImpl.h"
@implementation WeexManager
+ (void)WeexInit
{
    NSLog(@"初始化");
    [WXSDKEngine initSDKEnvironment];
    
//    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
//    [WXSDKEngine registerHandler:[WXEventModule new] withProtocol:@protocol(WXEventModuleProtocol)];
    
//    [WXSDKEngine registerComponent:@"select" withClass:NSClassFromString(@"WXSelectComponent")];
//    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
//    [WXSDKEngine registerModule:@"syncTest" withClass:[WXSyncTestModule class]];
}
@end
