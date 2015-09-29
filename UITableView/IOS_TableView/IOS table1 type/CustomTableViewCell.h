//
//  CustomTableViewCell.h
//  IOS table1 type
//
//  Created by 李腾飞 on 15/1/24.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@end
