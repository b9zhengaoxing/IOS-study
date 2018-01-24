//
//  Demo1ViewController.m
//  FramePractice
//
//  Created by 李腾飞 on 2018/1/19.
//  Copyright © 2018年 李腾飞. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()
@property(strong,nonatomic)UIView *view1;
@property(strong,nonatomic)UIView *view2;

@end

@implementation Demo1ViewController
@synthesize view1,view2;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemoView];
    [self changeOrigin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- 坐标情况
//frame: 该view在父view坐标系统中的位置和大小。（参照点是，父亲的坐标系统）
//bounds：该view在本地坐标系统中的位置和大小。（参照点是，本地坐标系统，就相当于ViewB自己的坐标系统，以0,0点为起点）。
//其实本地坐标系统的关键就是要知道的它的原点（0，0）在父坐标系统中的什么位置（这个位置是相对于父view的本地坐标系统而言的，最终的父view就是UIWindow，它的本地坐标系统原点就是屏幕的左上角了）。
//通过修改view的bounds属性可以修改本地坐标系统的原点位置。

- (void)createDemoView{
    view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];//添加到self.view
    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(view1.frame),NSStringFromCGRect(view1.bounds));
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [view1 addSubview:view2];//添加到view1上,[此时view1坐标系左上角起点为(0,0)]
    NSLog(@"view2 frame:%@========view2 bounds:%@",NSStringFromCGRect(view2.frame),NSStringFromCGRect(view2.bounds));
}

- (void)changeOrigin{
    [view1 setBounds:CGRectMake(-20, -20, 200, 200)];//添加到view1上,[此时view1坐标系左上角起点为(-20,-20)]
}






@end
