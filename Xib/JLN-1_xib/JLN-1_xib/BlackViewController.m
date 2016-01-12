//
//  BlackViewController.m
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/28.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "BlackViewController.h"

@interface BlackViewController ()

@end

@implementation BlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.titleLabel.textColor = [UIColor whiteColor];
}

+ (instancetype)viewControllerFromNIB {
    return [[BlackViewController alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
