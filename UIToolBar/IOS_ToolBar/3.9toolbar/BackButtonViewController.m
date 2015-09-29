//
//  BackButtonViewController.m
//  3.9toolbar
//
//  Created by Bc_Ltf on 15/4/10.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "BackButtonViewController.h"

@interface BackButtonViewController ()

@end

@implementation BackButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatCustomBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 定制返回按钮
-(void)creatCustomBack
{
    // 1 隐藏系统返回按钮
    [self.navigationItem setHidesBackButton:YES];
    
    // 2 自定义返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 5, 24, 24);
    [btn setBackgroundImage:[UIImage imageNamed:@"通讯记录返回.png"] forState:UIControlStateNormal];
    [btn addTarget: self action: @selector(goBackAction) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem*back=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    // 3 把BarButtonItem 设置为 navigationItem的leftBarButton。
    self.navigationItem.leftBarButtonItem=back;
}

// 4 编写Button的事件代码。
-(void)goBackAction{
    // 在这里增加返回按钮的自定义动作
    [self.navigationController popViewControllerAnimated:YES];
}


@end
