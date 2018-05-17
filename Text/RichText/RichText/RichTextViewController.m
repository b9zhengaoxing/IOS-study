//
//  RichTextViewController.m
//  RichText
//
//  Created by tengfei li on 26/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "RichTextViewController.h"

@interface RichTextViewController ()

@end

@implementation RichTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setRichTextField:(UITextField *)richTextField
{
    //属性函数
    NSDictionary *attri = @{
                            NSForegroundColorAttributeName:[UIColor redColor],
                            NSBackgroundColorAttributeName:[UIColor yellowColor],
                            };
    NSString *string = @"测试";
    NSRange range = NSMakeRange(0, string.length);
    
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:string];
    [attriString addAttributes:attri range:range];
    
    richTextField.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:72];
    
    richTextField.attributedText = [[NSAttributedString alloc] initWithAttributedString:attriString];

}



@end
