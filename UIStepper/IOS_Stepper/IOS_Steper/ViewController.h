//
//  ViewController.h
//  IOS_Steper
//
//  Created by Bc_Ltf on 15/4/9.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//  学习参考网址：http://www.itnose.net/detail/6193804.html

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UIStepper *numStepper;
- (IBAction)valueChange:(id)sender;

@end

