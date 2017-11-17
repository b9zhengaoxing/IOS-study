//
//  ViewController.m
//  DateDemo
//
//  Created by 李腾飞 on 2017/11/1.
//  Copyright © 2017年 李腾飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *lastDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"KLastPush22Date"];
    NSDate *date = [NSDate date];//给定的时间
    NSDate *lastRateDay = [NSDate dateWithTimeInterval:-24*60*60*7 sinceDate:date];//前rate天 //计算一个时间
    
    if (!lastDate) {
//        return YES;
    }
    if ([lastRateDay compare:lastDate] == NSOrderedAscending) //左边比右边小和右边
    {
//        return NO;
    }
//    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
