//
//  UILabel+String.h
//  IOS_Label
//
//  Created by 李腾飞 on 2017/7/18.
//  Copyright © 2017年 Bc_ltf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (String)
/**
 设置文本,并指定行间距
 
 @param text 文本内容
 @param lineSpacing 行间距
 */
-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

@end
