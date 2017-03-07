//
//  ViewController.m
//  WeexClient
//
//  Created by LKLFS on 2017/3/1.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "ViewController.h"
#import <WeexFrameworks/WeexFrameworks.h>
#import "DemoDefine.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *weexView;

@property (nonatomic, strong) NSArray *refreshList;
@property (nonatomic, strong) NSArray *refreshList1;
@property (nonatomic, strong) NSArray *refresh;
@property (nonatomic) NSInteger count;

@property (nonatomic, assign) CGFloat weexHeight;
@property (nonatomic, weak) id<UIScrollViewDelegate> originalDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    Weex * we = [[Weex alloc] init];
    
    [we renderWithUrl:[NSURL URLWithString:HOME_URL] target:self];
//    [we loadLocalBundle:[NSURL URLWithString:]];
}



@end
