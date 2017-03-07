//
//  WeexManager.h
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/7.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeexManager : NSObject

@property (strong, nonatomic) NSString *latestVer;
+ (id)wxr;

+ (void)WeexInit;
+ (void)initSDKEnvironment;
+ (void)registerComponentWithString:(NSString *)name WithClass:(NSString *)class;
+ (void)registerComponentsWithDictionary:(NSDictionary *)dictionary;
+ (void)registerModuleWithString:(NSString *)name WithClass:(Class)class;
+ (void)registerModulesWithDictionary:(NSDictionary *)dictionary;

+ (void)renderWithUrl:(NSURL *)url target:(id)controller;

@end
