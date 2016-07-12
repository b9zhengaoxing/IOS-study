//
//  PartViewController.m
//  IOS_Image
//
//  Created by 李腾飞 on 16/7/5.
//  Copyright © 2016年 Bc_ltf. All rights reserved.
//

#import "PartViewController.h"

@interface PartViewController ()

@end

@implementation PartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //不设置拉伸点，直接设置
    UIImage *image1 = [UIImage imageNamed:@"subScribe_guide_describe_down"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
    imageView1.image = image1;
    [self.view addSubview:imageView1];
    
    
    // @ 自适应后的大小获取
    
    UILabel * textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 400, 30)];
    textLabel.textColor = [UIColor whiteColor];
    [textLabel setFont:[UIFont systemFontOfSize:15.0f]];
    CGSize textMaxSize = CGSizeMake(500, 500);
    UIFont * PBtnFont = [UIFont systemFontOfSize:15.0f];
    textLabel.text = @"工欲善其事必先利其器我擦啥情况";  //你要传入的文本
    textLabel.adjustsFontSizeToFitWidth = YES;
    
    // @ !就是这里！
    CGSize textRealSize = [textLabel.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:PBtnFont} context:nil].size;
    
    //设置拉伸点 横向拉伸
    //@ 0.5以下左边 0.5以上右边
    UIImage *image2 = [UIImage imageNamed:@"subScribe_guide_describe_down"];
    image2 = [image2 stretchableImageWithLeftCapWidth:image2.size.width*0.23 topCapHeight:image2.size.height*1];
    // 右边
    // image2 = [image2 stretchableImageWithLeftCapWidth:image2.size.width*0.73 topCapHeight:image2.size.height*1];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, textRealSize.width+30, 80)];
    imageView2.image = image2;
    [imageView2 addSubview:textLabel];
    
    [self.view addSubview:imageView2];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
