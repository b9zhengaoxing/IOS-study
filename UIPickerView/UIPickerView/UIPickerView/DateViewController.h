//
//  DateViewController.h
//  UIPickerView
//
//  Created by tengfei li on 25/2/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePick;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)onClick:(id)sender;

@end
