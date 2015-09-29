//
//  CustomBarViewController.m
//  3.9toolbar
//
//  Created by Bc_Ltf on 15/4/10.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "CustomBarViewController.h"

@interface CustomBarViewController ()

@end

@implementation CustomBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationBar.titleTextAttributes=dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
