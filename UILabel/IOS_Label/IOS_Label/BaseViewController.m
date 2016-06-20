//
//  BaseViewController.m
//  IOS_Label
//
//  Created by 李腾飞 on 16/6/1.
//  Copyright © 2016年 Bc_ltf. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
/*
 Accessing the Text Attributes 字体属性
 text  property --- default is nil
 font  property --- default is nil (system font 17 plain)
 textColor  property --- default is nil (text draws black)
 textAlignment  property --- default is NSTextAlignmentLeft
 lineBreakMode  property --- default is NSLineBreakByTruncatingTail. used for single and multiple lines of text
 enabled  property
 
 Drawing a Shadow
 shadowColor  property  ---  // default is nil (no shadow)
 shadowOffset  property ---  // default is CGSizeMake(0, -1) -- a top shadow
 
 -----------
 setRichText
 // the underlying attributed string drawn by the label, if set, the label ignores the properties above.
 // 下面的属性会绘制Label，如果设置了，就会忽视以上所有属性
 attributedText property --
 
 Sizing the Label’s Text
 adjustsFontSizeToFitWidth  property  --- default is NO
 baselineAdjustment  property         --- default is UIBaselineAdjustmentAlignBaselines
 numberOfLines  property              --- default is 1
 @this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
 @if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
 truncated using the line break mode.

 @当sizeToFit调用时候，这个属性决定了绘制多少行，默认值是1，为零的时候，是没有限制的意思。

 
 Managing Highlight Values
 highlightedTextColor  property  --- default is nil
 highlighted           property  --- default is NO
 

 
 Drawing and Positioning Overrides
 – textRectForBounds:limitedToNumberOfLines: 无例
 – drawTextInRect:  无例
 
 Setting and Getting Attributes
 userInteractionEnabled  property
 */
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self setting];
    [self setting2];
}

- (void)setting
{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 60.0, 200.0, 50.0)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 80.0, 200.0, 50.0)];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 140.0, 200.0, 50.0)];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 200.0, 200.0, 50.0)];
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 260.0, 200.0, 50.0)];
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 320.0, 200.0, 50.0)];
    UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(50.0, 380.0, 200.0, 50.0)];
    
    //设置显示文字
    label1.text = @"label1";
    label2.text = @"label2";
    label3.text = @"label3--label3--label3--label3--label3--label3--label3--label3--label3--label3--label3--";
    label4.text = @"label4--label4--label4--label4--";
    label5.text = @"label5--label5--label5--label5--label5--label5--";
    label6.text = @"label6";
    label7.text = @"label7";
    
    
    //设置字体:粗体，
    // @正常的是 SystemFontOfSize
    // @斜体字 italicSystemFontOfSize
    label1.font = [UIFont boldSystemFontOfSize:20];
    
    //设置文字颜色
    label1.textColor = [UIColor orangeColor];
    label2.textColor = [UIColor purpleColor];
    
    //设置文字位置
    //    typedef NS_ENUM(NSInteger, NSTextAlignment) {
    //        NSTextAlignmentLeft      = 0,    // Visually left aligned
    //        NSTextAlignmentCenter    = 1,    // Visually centered
    //        NSTextAlignmentRight     = 2,    // Visually right aligned
    //        NSTextAlignmentJustified = 3,    // Fully-justified. The last line in a paragraph is natural-aligned. 段落的最后一行自然对齐
    //        NSTextAlignmentNatural   = 4,    // Indicates the default alignment for script
    //    } NS_ENUM_AVAILABLE_IOS(6_0);
    label1.textAlignment = NSTextAlignmentLeft;
    label2.textAlignment = NSTextAlignmentCenter;
    
    //设置字体大小适应label宽度
    label4.adjustsFontSizeToFitWidth = YES;
    
    //设置label的行数
    label5.numberOfLines = 2;
    
    //设置高亮
    label6.highlighted = YES;
    label6.highlightedTextColor = [UIColor orangeColor];
    
    //设置阴影
    label7.shadowColor = [UIColor redColor];
    label7.shadowOffset = CGSizeMake(1.0,1.0);
    
    //设置是否能与用户进行交互
    label7.userInteractionEnabled = YES;
    
    //设置label中的文字是否可变，默认值是YES
    label3.enabled = NO;
    
    //设置文字过长时的显示格式
    label3.lineBreakMode = NSLineBreakByTruncatingMiddle;//截去中间
    //  typedef enum {
    //      UILineBreakModeWordWrap = 0,
    //      UILineBreakModeCharacterWrap,
    //      UILineBreakModeClip,//截去多余部分
    //      UILineBreakModeHeadTruncation,//截去头部
    //      UILineBreakModeTailTruncation,//截去尾部
    //      UILineBreakModeMiddleTruncation,//截去中间
    //  } UILineBreakMode;(IOS2.0——IOS6.0)
    //    typedef NS_ENUM(NSInteger, NSLineBreakMode) {
    //        NSLineBreakByWordWrapping = 0,     	// Wrap at word boundaries, default
    //        NSLineBreakByCharWrapping,		// Wrap at character boundaries
    //        NSLineBreakByClipping,		// Simply clip
    //        NSLineBreakByTruncatingHead,	// Truncate at head of line: "...wxyz"
    //        NSLineBreakByTruncatingTail,	// Truncate at tail of line: "abcd..."
    //        NSLineBreakByTruncatingMiddle	// Truncate middle of line:  "ab...yz"
    //    } NS_ENUM_AVAILABLE(10_0, 6_0);
    
    //如果adjustsFontSizeToFitWidth属性设置为YES，这个属性就来控制文本基线的行为
    label4.baselineAdjustment = UIBaselineAdjustmentNone;
    //  typedef enum {
    //      UIBaselineAdjustmentAlignBaselines,
    //      UIBaselineAdjustmentAlignCenters,
    //      UIBaselineAdjustmentNone,
    //  } UIBaselineAdjustment;
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:label6];
    [self.view addSubview:label7];
    
    
    _msgTipLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 50)];
    [self.view addSubview:_msgTipLabel];
    
    // 文字
    [_msgTipLabel setText:@"基本label"];
    
    // 颜色
    [_msgTipLabel setBackgroundColor:[UIColor blueColor]];
    
    // 字体大小
    [_msgTipLabel setFont:[UIFont systemFontOfSize:10]];
    
    // 字体颜色
    [_msgTipLabel setTextColor:[UIColor whiteColor]];

    // 设置圆角
    _msgTipLabel.layer.cornerRadius = 6;
    _msgTipLabel.layer.masksToBounds = YES;
}

// 图文混排
// 参考文章：http://www.jianshu.com/p/5828173adc3a
- (void)setting2
{
    _richTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 450, 300, 50)];
    [self.view addSubview:_richTextLabel];
    
    // 创建一个富文本
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:@"哈哈哈哈哈123456789"];
    
    // 修改富文本中的不同文字的样式
    [attri addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 5)];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    
    // 设置数字为红色
    [attri addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 9)];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(5, 9)];
    
    // 添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"图片.png"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 32, 32);
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri appendAttributedString:string];
    
    // 用label的attributedText属性来使用富文本
    _richTextLabel.attributedText = attri;
}

@end
