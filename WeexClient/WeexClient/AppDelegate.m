//
//  AppDelegate.m
//  WeexClient
//
//  Created by LKLFS on 2017/3/1.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "AppDelegate.h"
#import <WeexFrameworks/WeexFrameworks.h>
#import "ViewController.h"
#import "DemoDefine.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [WeexManager WeexInit];
    
    self.window.rootViewController = [[[WeexManager wxr] alloc] initWithRootViewController:[self demoController]];
    [self.window makeKeyAndVisible];

    return YES;
}

- (UIViewController *)demoController
{
    ViewController *demo = [[ViewController alloc] init];
    
#if DEBUG
    //If you are debugging in device , please change the host to current IP of your computer.
    demo.url = [NSURL URLWithString:HOME_URL];
#else
    demo.url = [NSURL URLWithString:BUNDLE_URL];
#endif
    
#ifdef UITEST
    ((WeexViewController *)demo).url = [NSURL URLWithString:UITEST_HOME_URL];
#endif
    
    return demo;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
