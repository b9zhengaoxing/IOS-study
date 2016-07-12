//
//  UseTouchesBeginViewController.m
//  xxkeyboard
//
//  Created by Bc_Ltf on 15/4/7.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "UseTouchesBeginViewController.h"

@interface UseTouchesBeginViewController ()

@end

@implementation UseTouchesBeginViewController
@synthesize useTouchesBegin;
@synthesize UseGesture;
@synthesize ChangeUIControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 成为第一响应者
    [self.useTouchesBegin becomeFirstResponder];
    [self createGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 1 使用touchesBegin
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [useTouchesBegin resignFirstResponder];
}


#pragma mark- 2 创建自定义的触摸手势来实现对键盘的隐藏：
-(void)createGesture
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [UseGesture resignFirstResponder];
}
#pragma mark- 3 修改storyBoard中UIView的Custom class为UIControl——就不实现了



@end
