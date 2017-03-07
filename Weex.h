//
//  Weex.h
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/7.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Weex : NSObject
- (void)renderWithUrl:(NSURL *)url target:(UIViewController *)controller;
- (void)loadLocalBundle:(NSURL *)url;

@end
