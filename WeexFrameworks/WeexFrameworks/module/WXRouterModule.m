//
//  RouterModule.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/13.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WXRouterModule.h"
//#import "WeexViewController.h"

@implementation WXRouterModule
WX_EXPORT_METHOD(@selector(push::))
WX_EXPORT_METHOD(@selector(pushForResult::::))
WX_EXPORT_METHOD(@selector(pop::))

@synthesize weexInstance;

- (void)push:(NSString *)url :(NSDictionary *)parameters
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
    [weexInstance renderWithURL:url options:parameters data:nil];
}

- (void)pushForResult:(NSString *)url :(NSInteger)requestCode :(NSString *)parameters :(WXCallback)callBack
{
    
}

- (void)pop:(NSInteger)resultCode :(NSString *)parameters
{
    
}
@end
