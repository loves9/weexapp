//
//  WXLogModule.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/10.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WXLogModule.h"

@implementation WXLogModule

WX_EXPORT_METHOD(@selector(d::))
WX_EXPORT_METHOD(@selector(e::))
WX_EXPORT_METHOD(@selector(i::))
WX_EXPORT_METHOD(@selector(w::))


- (void)d:(NSString *)tag :(NSString *)message
{
    if (DEBUG) {
        NSLog(@"✅Tag:%@, Mesaage:%@", tag, message);
    }
}

- (void)e:(NSString *)tag :(NSString *)message
{
    if (DEBUG) {
        NSLog(@"❌Tag:%@, Mesaage:%@", tag, message);
    }
}

- (void)i:(NSString *)tag :(NSString *)message
{
    if (DEBUG) {
        NSLog(@"ℹ️Tag:%@, Mesaage:%@", tag, message);
    }
}

- (void)w:(NSString *)tag :(NSString *)message
{
    if (DEBUG) {
        NSLog(@"⚠️Tag:%@, Mesaage:%@", tag, message);
    }
}
@end
