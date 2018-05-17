//
//  NSString+Size.h
//  IOS_Label
//
//  Created by 李腾飞 on 2018/5/17.
//  Copyright © 2018年 Bc_ltf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 参考：https://www.jianshu.com/p/8b8d208b0a26
 */
@interface NSString (Size)
+ (CGSize)sizeWithString:(NSString*)str andFont:(UIFont*)font andMaxSize:(CGSize)size;
@end
