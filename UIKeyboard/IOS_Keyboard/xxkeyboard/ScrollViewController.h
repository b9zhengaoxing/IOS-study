//
//  ScrollViewController.h
//  xxkeyboard
//
//  Created by Bc_Ltf on 15/4/7.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController
{
    BOOL keyboardVisible;   //键盘出现标识
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
