//
//  ViewController.m
//  3.9toolbar
//
//  Created by h92 on 14/12/22.
//  Copyright (c) 2014年 李腾飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)child:(id)sender {
    self.label.text=@"孩子";
}

- (IBAction)fuck:(id)sender {
    self.label.text=@"我靠";
}
@end
