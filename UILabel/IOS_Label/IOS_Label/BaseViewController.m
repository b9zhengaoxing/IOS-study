//
//  BaseViewController.m
//  IOS_Label
//
//  Created by 李腾飞 on 16/6/1.
//  Copyright © 2016年 Bc_ltf. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad
{
    [self setting];
}

- (void)setting
{
    _msgTipLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:_msgTipLabel];
    
    // 文字
    [_msgTipLabel setText:@"基本label"];
    
    // 颜色
    [_msgTipLabel setBackgroundColor:[UIColor blueColor]];
    
    // 字体大小
    [_msgTipLabel setFont:[UIFont systemFontOfSize:10]];
    
    // 字体颜色
    [_msgTipLabel setTextColor:[UIColor whiteColor]];
    
    // 设置圆角
    _msgTipLabel.layer.cornerRadius = 6;
    _msgTipLabel.layer.masksToBounds = YES;
}

@end
