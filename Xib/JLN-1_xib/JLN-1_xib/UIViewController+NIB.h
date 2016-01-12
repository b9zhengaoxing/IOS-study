//
//  UIViewController+NIB.h
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/28.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NIB)

// 要求xib文件名和View Controller类名一致
+ (instancetype)loadFromNib;

@end
