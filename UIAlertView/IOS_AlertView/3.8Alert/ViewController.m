//
//  ViewController.m
//  3.8Alert
//
//  Created by h92 on 14/12/22.
//  Copyright (c) 2014年 李腾飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark- cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 警告框
/**
 *  警告
 *
 *  @param sender 警告button
 */
- (IBAction)textAlert:(id)sender {
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"警告"
                                                     message:@"出事啦"
                                                    delegate:self
                                           cancelButtonTitle:@"没事"
                                           otherButtonTitles:@"知道了", nil];
    
    [alertView show];
    
}

/**
 *  UIAlertViewDelegate Protocol  获取警告框判断
 *
 *  @param alertView   警告框
 *  @param buttonIndex index
 */
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int a=(int)buttonIndex;
    NSLog(@"AlertView%i",a);
}


#pragma mark- actionSheet
/**
 *  操作表
 *
 *  @param sender button
 */
- (IBAction)textActionSheet:(id)sender {
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"擦"
                                                     delegate:self
                                            cancelButtonTitle:@"没事"
                                       destructiveButtonTitle:@"哦"
                                            otherButtonTitles:@"新浪微博",@"腾讯", nil];
    [action showInView:self.view];
}

/**
 *  UIActionSheetDelegate
 *
 *  @param actionSheet 操作表
 *  @param buttonIndex index
 */
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int a=(int)buttonIndex;
    NSLog(@"ActionSheet%i",a);
}





@end
