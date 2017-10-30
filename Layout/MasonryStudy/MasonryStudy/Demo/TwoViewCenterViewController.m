//
//  TwoViewCenterViewController.m
//  MasonryStudy
//
//  Created by 李腾飞 on 16/7/26.
//  Copyright © 2016年 李腾飞. All rights reserved.
//

#import "Masonry.h"
#import "TwoViewCenterViewController.h"

@interface TwoViewCenterViewController ()

@end

@implementation TwoViewCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *sv = [UIView new];
    
    [self create1];
}

#pragma Mark - A--|--B
//在做autoLayout之前 一定要先将view添加到superview上 否则会报错
-(void)create1
{
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor greenColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //在Y轴居中
        make.centerY.equalTo(self.view);
        
        //right 距离中线15px
        make.right.equalTo(self.view.mas_centerX).with.offset(-15);
        
        //将size设置成(60,30)
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        //在Y轴居中
        make.centerY.equalTo(sv);
        
        //left 距离sv 15px
        make.left.equalTo(sv.mas_right).with.offset(30);
        
        //将size设置成(50,30)
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
