//
//  ReadParameterFromFile.h
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/13.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadParameterFromFile : NSObject
+ (NSDictionary *)readJsonParametersFromFile:(NSString *)fileName;
+ (NSDictionary *)readPlistParametersFromFile:(NSString *)fileName;
@end
