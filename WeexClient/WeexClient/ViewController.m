//
//  ViewController.m
//  WeexClient
//
//  Created by LKLFS on 2017/3/1.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "ViewController.h"
#import "WeexLibrary/WeexLibrary.h"
#import <WeexSDK/WeexSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    [WeexLibrary WeexInit];
}


@end
