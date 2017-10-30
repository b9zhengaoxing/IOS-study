//
//  DownDissmissViewController.m
//  GestureDemo
//
//  Created by 李腾飞 on 2017/6/16.
//  Copyright © 2017年 李腾飞. All rights reserved.
//

#import "DownDissmissViewController.h"

@interface DownDissmissViewController ()
@property(nonatomic,strong) UIView * textView;
@end

@implementation DownDissmissViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)/3, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)*2/3)];
    _textView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_textView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [_textView addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark pan   平移手势事件
-(void)panView:(UIPanGestureRecognizer *)sender{
    CGPoint translation=[sender translationInView:self.view];//利用拖动手势的translationInView:方法取得在相对指定视图（这里是控制器根视图）的移动
    if (sender.state==UIGestureRecognizerStateChanged) {
        self.textView.transform=CGAffineTransformMakeTranslation(0, translation.y);
    }else if(sender.state==UIGestureRecognizerStateEnded){
        
        if (translation.y < CGRectGetHeight(self.textView.frame)*2/3) {
            [UIView animateWithDuration:0.5 animations:^{
                self.textView.transform=CGAffineTransformIdentity;
            }];
        }else{
            [self dismissView];
            
        }
    }
}

//返回
- (void)dismissView{
    [UIView animateWithDuration:0.25 animations:^{
        [self.textView setFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), self.view.frame.size.width, self.textView.frame.size.width)];
        //        [self.textView removeFromSuperview];
    }];
    [self.textView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.25];
}

@end
