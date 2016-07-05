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

#pragma mark- Cell 和 Keyboard遮挡问题的记录
//    1. 根本不需要做适配，苹果已经做好了相应的适配：IOS9 IOS8 IOS7 中均有
//    2. Cell自动移动


#pragma mark- Cell 上的引导
//    1. 指向Button
//    2. 随着随着TableView滚动
//    3. 见《自定义而Cell》

#pragma mark- TableView悬浮窗的实现
//    1. 计算ScrollView的偏移，时时改变控件的偏移

@end
