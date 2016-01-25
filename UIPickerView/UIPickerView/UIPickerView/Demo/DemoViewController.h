//
//  DemoViewController.h
//  UIPickerView
//
//  Created by tengfei li on 12/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
/**
 *  选择器
 */
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
/**
 *  歌曲输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *singTextField;

/**
 *  选择
 *
 *  @param sender UIButton
 */
- (IBAction)buttonPressed:(id)sender;

@end
