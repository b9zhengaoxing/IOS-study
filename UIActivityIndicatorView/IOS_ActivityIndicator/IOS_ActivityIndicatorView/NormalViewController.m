//
//  NormalViewController.m
//  IOS_ActivityIndicatorView
//
//  Created by Maculish Ting on 1/7/15.
//  Copyright (c) 2015年 LYD. All rights reserved.
//

#import "NormalViewController.h"

@interface NormalViewController ()

@end

@implementation NormalViewController
@synthesize myTimer;
@synthesize background;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MyActivityIndicator.hidesWhenStopped=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressToStart:(id)sender {
    // backgroundView
    background=[[UIView alloc]initWithFrame:self.view.frame];
    background.alpha=0.5;
    background.backgroundColor=[UIColor grayColor];
    [self.view addSubview:background];
    
    //loaction
    [self.view bringSubviewToFront:background];
    [self.view bringSubviewToFront:self.MyActivityIndicator];
    
    //begin
    [self.MyActivityIndicator startAnimating];
    myTimer = [NSTimer scheduledTimerWithTimeInterval:4.0
                                               target:self
                                             selector:@selector(download)
                                             userInfo:nil
                                              repeats:YES];
    

}

//end of
-(void)download
{
    [myTimer invalidate];
    [self.MyActivityIndicator stopAnimating];
    [self.background removeFromSuperview];
}

@end
