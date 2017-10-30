//
//  WeixinViewController.m
//  GestureDemo
//
//  Created by 李腾飞 on 2017/6/16.
//  Copyright © 2017年 李腾飞. All rights reserved.
//

#import "WeixinViewController.h"

@interface WeixinViewController ()
@property(strong,nonatomic) UIView * contentView;
@property(strong,nonatomic) UIView * testView;

@end

@implementation WeixinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    _contentView = [[UIView alloc]initWithFrame:self.view.frame];
    _contentView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_contentView];
    
    _testView = [[UIView alloc]initWithFrame:self.view.frame];
    _testView.backgroundColor = [UIColor grayColor];
    [_contentView addSubview:_testView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [_testView addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark pan   平移手势事件
-(void)panView:(UIPanGestureRecognizer *)sender{
    CGPoint translation=[sender translationInView:self.view];//利用拖动手势的translationInView:方法取得在相对指定视图（这里是控制器根视图）的移动
    if (sender.state==UIGestureRecognizerStateChanged) {
        self.testView.transform=CGAffineTransformMakeTranslation(translation.x, translation.y);
        if (translation.y>0) {
            [self.contentView setAlpha:translation.y/CGRectGetHeight(self.view.frame)];
        }
    }else if(sender.state==UIGestureRecognizerStateEnded){
        
        if (translation.y < CGRectGetHeight(self.testView.frame)*2/3) {
            [UIView animateWithDuration:0.5 animations:^{
                self.testView.transform=CGAffineTransformIdentity;
            }];
        }else{
            [self dismissView];
            
        }
    }
}

//返回
- (void)dismissView{
    [UIView animateWithDuration:0.25 animations:^{
        [self.testView setFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), self.view.frame.size.width, self.testView.frame.size.width)];
        //        [self.textView removeFromSuperview];
    }];
    [self.testView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.25];
}

@end
