//
//  NormalDetailViewController.m
//  IOS_Collection
//
//  Created by Bc_Ltf on 15/4/11.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "NormalDetailViewController.h"

@interface NormalDetailViewController ()

@end

@implementation NormalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.image = self.image;
}

@end
