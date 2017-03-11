//
//  WXButton.m
//  WeexFrameworks
//
//  Created by LKLFS on 2017/3/9.
//  Copyright © 2017年 LKLFS. All rights reserved.
//

#import "WXButton.h"
#import "UIColor+ColorTransfer.h"

@interface WXButton ()
@property (nonatomic, strong) UIButton * button;

@end
@implementation WXButton

//@Override
- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        _button = [[UIButton alloc] init];

        if (attributes[@"text"]) {
            [_button setTitle:attributes[@"text"] forState:UIControlStateNormal];
        }
        if (attributes[@"textSize"]) {
//            [_button.titleLabel setFont:[UIFont systemFontOfSize:[attributes[@"textSize"] integerValue]/2]];
        }
        if (attributes[@"textColor"]) {
            [_button.titleLabel setTextColor: [UIColor colorWithHexString:attributes[@"textColor"]]];
        }
        
    }
    
    return self;
}

- (void)viewWillUnload
{
}

- (UIView *)loadView {
    
    return _button;
}

- (void)updateAttributes:(NSDictionary *)attributes
{
}

- (void)updateStyles:(NSDictionary *)styles
{
    
}
@end
