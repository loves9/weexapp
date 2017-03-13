//
//  ReadParameterFromFile.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/13.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "ReadParameterFromFile.h"

@implementation ReadParameterFromFile

+ (NSDictionary *)readJsonParametersFromFile:(NSString *)fileName
{
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"json"]];
    NSDictionary *jsonDict = nil;
    @try {
        jsonDict = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    } @catch (NSException *exception) {
        @throw exception;
    } @finally {
        //
    }
    
    return jsonDict;
}

+ (NSDictionary *)readPlistParametersFromFile:(NSString *)fileName
{
    NSDictionary *dataDict = nil;
    @try {
        dataDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
    } @catch (NSException *exception) {
        @throw exception;
    } @finally {
        //
    }
    return dataDict;
}
@end
