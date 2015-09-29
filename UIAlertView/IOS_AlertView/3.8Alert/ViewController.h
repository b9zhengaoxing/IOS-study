//
//  ViewController.h
//  3.8Alert
//
//  Created by h92 on 14/12/22.
//  Copyright (c) 2014年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate>

/**
 *  警告框
 *
 *  @param sender button
 */
- (IBAction)textAlert:(id)sender;

/**
 *  操作表
 *
 *  @param sender button
 */
- (IBAction)textActionSheet:(id)sender;


@end

