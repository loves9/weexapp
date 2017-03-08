//
//  ViewController.m
//  WeexClient
//
//  Created by LKLFS on 2017/3/1.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "ViewController.h"
#import "DemoDefine.h"
#import "UIViewController+WXDemoNaviBar.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [_instance fireGlobalEvent:WX_APPLICATION_DID_BECOME_ACTIVE params:nil];
//    [self updateInstanceState:WeexInstanceAppear];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [self updateInstanceState:WeexInstanceDisappear];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
//    [_we fireGlobalEvent:WX_APPLICATION_WILL_RESIGN_ACTIVE params:nil];
}

//TODO get height
- (void)viewDidLayoutSubviews
{
//    _weexHeight = self.view.frame.size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupNaviBar];
    [self setupRightBarItem];
    
    [self renderWithUrl:nil];
//    [we loadLocalBundle:[NSURL URLWithString:]];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationRefreshInstance:) name:@"RefreshInstance" object:nil];
}

- (void)setupRightBarItem
{
    if ([self.url.scheme isEqualToString:@"http"]) {
        [self loadRefreshCtl];
    }
}

- (void)dealloc{
//    [self.instance destroyInstance];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
