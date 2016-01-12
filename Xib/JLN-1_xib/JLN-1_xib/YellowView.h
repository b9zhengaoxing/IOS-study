//
//  YellowView.h
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/28.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YellowView : UIView

+ (instancetype)viewFromNIB;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
