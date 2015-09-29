//
//  AutoLayoutViewController.m
//  111
//
//  Created by Maculish Ting on 13/7/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "AutoLayoutViewController.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController
@synthesize ContentViewHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  判断大小，做出适配
-(void)viewWillLayoutSubviews
{
    if(HEIGHT>600)
    {
        ContentViewHeight.constant=HEIGHT*2;
    }
}

@end
