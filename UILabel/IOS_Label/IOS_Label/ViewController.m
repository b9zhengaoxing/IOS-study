//
//  ViewController.m
//  IOS_Label
//
//  Created by Bc_Ltf on 15/4/7.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary * _preRollAdsDictionary;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _preRollAdsDictionary = [[NSMutableDictionary alloc]init];
    if (_preRollAdsDictionary==nil || ![_preRollAdsDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSDictionary *tmpDic = [NSDictionary dictionaryWithDictionary:_preRollAdsDictionary];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
