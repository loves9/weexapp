//
//  ViewController.m
//  WeexClient
//
//  Created by LKLFS on 2017/3/1.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"111111111");
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"222222222");
        });
    }];
    [op start];
    NSLog(@"333333");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
