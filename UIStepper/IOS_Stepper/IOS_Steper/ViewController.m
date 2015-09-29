//
//  ViewController.m
//  IOS_Steper
//
//  Created by Bc_Ltf on 15/4/9.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController
@synthesize numStepper;
@synthesize numTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup
{
//  设置4个属性：最大，最小，初始，一次
    numStepper.maximumValue=10;
    numStepper.minimumValue=0;
    numStepper.stepValue=1;
    numStepper.value=0;
}
- (IBAction)valueChange:(id)sender {
    numTextField.text=[NSString stringWithFormat:@"%d",(int)numStepper.value];
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //  如果超范围，不让改
    if(numTextField.text.intValue<0)
    {
        numTextField.text=@"0";
    }
    if (numTextField.text.intValue>10) {
        numTextField.text=@"10";
    }
    numStepper.value=numTextField.text.intValue;
    return YES;
}

#pragma mark- 点击View键盘回缩
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [numTextField resignFirstResponder];
}
@end
