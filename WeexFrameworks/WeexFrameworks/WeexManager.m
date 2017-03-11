//
//  WeexManager.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/7.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WeexManager.h"
#import <WeexSDK/WeexSDK.h>
#import "WXStreamModule.h"
#import "WXEventModule.h"
#import "WXNavigationDefaultImpl.h"
#import "WXImgLoaderDefaultImpl.h"
#import "WXSyncTestModule.h"
#import <ATSDK/ATManager.h>
#import "WXLogModule.h"
#import "WXHttpModule.h"

@interface WeexManager ()

@end
@implementation WeexManager
+ (WXRootViewController *)wxr
{
    return [WXRootViewController class];
}
// 初始化
+ (void)WeexInit
{
    [WXSDKEngine initSDKEnvironment];
    
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXSDKEngine registerHandler:[WXEventModule new] withProtocol:@protocol(WXEventModuleProtocol)];
    
    [WXSDKEngine registerComponent:@"select" withClass:NSClassFromString(@"WXSelectComponent")];
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    [WXSDKEngine registerModule:@"syncTest" withClass:[WXSyncTestModule class]];
    
    [WXSDKEngine registerComponent:@"button" withClass:NSClassFromString(@"WXButton")];
    [WXSDKEngine registerModule:@"log" withClass:[WXLogModule class]];
    [WXSDKEngine registerModule:@"http" withClass:[WXHttpModule class]];


    
#if !(TARGET_IPHONE_SIMULATOR)
    [self checkUpdate];
#endif
    
#ifdef DEBUG
//    [self atAddPlugin];
    [WeexManager instanceMethodForSelector:@selector(atAddPlugin)];

    [WXDebugTool setDebug:YES];
    [WXLog setLogLevel:WXLogLevelLog];
    
#ifndef UITEST
    [[ATManager shareInstance] show];
#endif
#else
    [WXDebugTool setDebug:NO];
    [WXLog setLogLevel:WXLogLevelError];
#endif
}

+ (void)initSDKEnvironment
{
    [WXSDKEngine initSDKEnvironment];
}

// 注册组件
+ (void)registerComponentWithString:(NSString *)name WithClass:(NSString *)class
{
    [WXSDKEngine registerComponent:name withClass:NSClassFromString(class)];
}

// 批量注册组件(键值为字符串类型)
+ (void)registerComponentsWithDictionary:(NSDictionary *)dictionary
{
    for(NSString * key in [dictionary allKeys]){
        [WXSDKEngine registerComponent:key withClass:NSClassFromString([dictionary valueForKey:key])];
    }
}

// 注册module
+ (void)registerModuleWithString:(NSString *)name WithClass:(Class)class
{
    [WXSDKEngine registerModule:name withClass:class];
}

// 批量注册module
+ (void)registerModulesWithDictionary:(NSDictionary *)dictionary
{
    for (NSString * key in [dictionary allKeys]) {
        [WXSDKEngine registerModule:key withClass:NSClassFromString([dictionary valueForKey:key])];
    }
}

- (void)atAddPlugin{
    
    [[ATManager shareInstance] addPluginWithId:@"weex" andName:@"weex" andIconName:@"../weex" andEntry:@"" andArgs:@[@""]];
    [[ATManager shareInstance] addSubPluginWithParentId:@"weex" andSubId:@"logger" andName:@"logger" andIconName:@"log" andEntry:@"WXATLoggerPlugin" andArgs:@[@""]];
    //    [[ATManager shareInstance] addSubPluginWithParentId:@"weex" andSubId:@"viewHierarchy" andName:@"hierarchy" andIconName:@"log" andEntry:@"WXATViewHierarchyPlugin" andArgs:@[@""]];
    [[ATManager shareInstance] addSubPluginWithParentId:@"weex" andSubId:@"test2" andName:@"test" andIconName:@"at_arr_refresh" andEntry:@"" andArgs:@[]];
    [[ATManager shareInstance] addSubPluginWithParentId:@"weex" andSubId:@"test3" andName:@"test" andIconName:@"at_arr_refresh" andEntry:@"" andArgs:@[]];
}

- (void)checkUpdate{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        NSString *URL = @"http://itunes.apple.com/lookup?id=1130862662";
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:URL]];
        [request setHTTPMethod:@"POST"];
        
        NSHTTPURLResponse *urlResponse = nil;
        NSError *error = nil;
        NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSString *results = [[NSString alloc] initWithBytes:[recervedData bytes] length:[recervedData length] encoding:NSUTF8StringEncoding];
        
        NSDictionary *dic = [WXUtility objectFromJSON:results];
        NSArray *infoArray = [dic objectForKey:@"results"];
        
        if ([infoArray count]) {
            NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
            weakSelf.latestVer = [releaseInfo objectForKey:@"version"];
            if ([weakSelf.latestVer floatValue] > [currentVersion floatValue]) {
                if (![[NSUserDefaults standardUserDefaults] boolForKey: weakSelf.latestVer]) {
                    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:weakSelf.latestVer];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Version" message:@"Will update to a new version" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"update", nil];
                        [alert show];
                    });
                }
            }
        }
    });
}

@end
