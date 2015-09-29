//
//  CheckBoxViewController.m
//  IOS_Button
//
//  Created by Bc_Ltf on 15/4/10.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "CheckBoxViewController.h"

@interface CheckBoxViewController ()

@end

@implementation CheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressCheckBox:(id)sender {
    UIButton* button=sender;
    button.selected=!button.selected;
}

@end
