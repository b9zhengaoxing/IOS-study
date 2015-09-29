//
//  CommonTableViewController.h
//  IOS table1 type
//
//  Created by h92 on 15/1/6.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonTableViewController : UITableViewController
{
    @private
    int buttonY;
}
//悬浮按钮
@property(strong,nonatomic)UIButton *flowButton;

@property (strong,nonatomic) NSMutableArray *dataList;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end
