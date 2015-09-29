//
//  B9ZGX_Label.m
//  IOS_Label
//
//  Created by Bc_Ltf on 15/4/9.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//  代码源头：http://blog.csdn.net/youcanping2008/article/details/9234191

#import "B9ZGX_Label.h"

@implementation B9ZGX_Label

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    // 获得绘图的上下文对象
    CGContextRef rf = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetRGBStrokeColor(rf, 0.0, 0.0, 0.0, 1);
    // 设置线的宽度
    CGContextSetLineWidth(rf, 1.0f);
    // 设置点
    CGContextMoveToPoint(rf, 0, self.frame.size.height/2);
    // 设置线条
    CGContextAddLineToPoint(rf, self.frame.size.width, self.frame.size.height/2);
    // 设置上下文
    CGContextStrokePath(rf);
    
}

@end
