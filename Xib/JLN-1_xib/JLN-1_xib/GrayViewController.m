//
//  GrayViewController.m
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/28.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "GrayViewController.h"

@interface GrayViewController ()

@end

@implementation GrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.titleLabel.text = @"Gray View";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:8.5f];
    
    [self.actionButton setTitle:@"action" forState:UIControlStateNormal];
    [self.actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 推荐从XIB文件中加载View Controller的方法，这种方法可以将XIB文件中的视图和其按钮响应事件全部封装在GrayViewController
// 如果GrayViewController的按钮响应事件由MainViewController作出响应，那么二者的耦合度就过高

// 建议:
// 单纯的通用View展示，使用从xib文件加载视图的方法，File's Owner设为nil
// 特定拥有者的View展示，从xib文件加载视图时，File's Owner设为拥有者
// 如果视图中有按钮响应事件，或其它可以和用户交互的事件，建议采用从XIB文件中加载View Controller的方法，这样可以封装UI展示和交互事件

- (IBAction)action:(id)sender {
    NSLog(@"action");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
