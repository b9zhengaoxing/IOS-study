//
//  ImageTextViewController.m
//  IOS_Button
//
//  Created by 李腾飞 on 16/8/1.
//  Copyright © 2016年 Bc_ltf. All rights reserved.
//

#import "ImageTextViewController.h"
#import "UIButton+ImageTitleStyle.h"

@interface ImageTextViewController ()

@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self create];
    
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 170, 90)];
//    button.backgroundColor = [UIColor yellowColor];
//    [button setTitle:@"测试" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"checkBox0.png"] forState:UIControlStateNormal];
//
//    CGRect imageRect = button.imageView.frame;
//    CGRect titleRect = button.titleLabel.frame;
//    [button setFrame:CGRectMake(20, 200, imageRect.size.width + 30 + titleRect.size.width, imageRect.size.height +20)];
//
//    [button setButtonImageTitleStyle:2 padding:20];
//    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)create{
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(120,100,80,80)];
    
    view2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view2];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(40,40)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view2.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(0,0)];
    
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    
    maskLayer1.frame = view2.bounds;
    
    maskLayer1.path = maskPath1.CGPath;
    
    view2.layer.mask = maskLayer1;
}

#pragma mark - 根据text 和image 确定label大小



@end
