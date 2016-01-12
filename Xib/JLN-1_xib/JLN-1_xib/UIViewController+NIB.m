//
//  UIViewController+NIB.m
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/28.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "UIViewController+NIB.h"

@implementation UIViewController (NIB)

+ (instancetype)loadFromNib {
    // [self class]会由调用的类决定
    Class controllerClass = [self class];
    NSLog(@"class = %@", controllerClass);
    return [[controllerClass alloc] initWithNibName:NSStringFromClass(controllerClass) bundle:[NSBundle mainBundle]];
}

@end
