//
//  WeexViewController.h
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/8.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeexViewController : UIViewController
@property (nonatomic, strong) NSString *script;
@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *source;

- (void)renderWithUrl:(NSURL *)url;

- (void)loadRefreshCtl;
@end
