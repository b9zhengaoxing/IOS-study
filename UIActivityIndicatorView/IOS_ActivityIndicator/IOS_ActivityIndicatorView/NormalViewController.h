//
//  NormalViewController.h
//  IOS_ActivityIndicatorView
//
//  Created by Maculish Ting on 1/7/15.
//  Copyright (c) 2015年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalViewController : UIViewController

//ActivityIndicator
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *MyActivityIndicator;
//Timer
@property (nonatomic) NSTimer *myTimer;
//backgrond
@property (strong,nonatomic) UIView *background;

- (IBAction)pressToStart:(id)sender;

@end
