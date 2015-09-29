//
//  ZoomMultViewController.m
//  111
//
//  Created by Maculish Ting on 13/7/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "ZoomMultViewController.h"

@interface ZoomMultViewController ()
{
    UIImageView *_imageview;
}

@end

@implementation ZoomMultViewController
@synthesize backgroundView;
@synthesize mySlider;

#pragma mark- cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setting];
    //1添加 UIScrollView
    //设置 UIScrollView的位置与屏幕大小相同
    [self.backgroundView addSubview:_scrollview];
    
    //2添加图片
    //有两种方式
    //(1)一般方式
    //    UIImageView  *imageview=[[UIImageView alloc]init];
    //    UIImage *image=[UIImage imageNamed:@"minion"];
    //    imageview.image=image;
    //    imageview.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    
    
    //(2)使用构造方法
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 520, 420)];
    _imageview.backgroundColor=[UIColor grayColor];
    
    //加上几个 测试试图
    //创建button阵列，5 * 4
    for(int i=0;i<4;i++)
    {
        for (int n=0; n<5; n++)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20+100*n, 20+100*i, 80, 80)];
            button.backgroundColor=[UIColor blueColor];
            
            button.layer.borderWidth=1;
            button.layer.borderColor=[[UIColor blackColor] CGColor];

            [_imageview addSubview:button];
            
        }//for
    }//for
    
    
    //调用initWithImage:方法，它创建出来的imageview的宽高和图片的宽高一样
    [_scrollview addSubview:_imageview];
    
    //设置UIScrollView的滚动范围和图片的真实尺寸一致
    _scrollview.contentSize=_imageview.frame.size;
    
    
    //设置实现缩放
    //设置代理scrollview的代理对象
    _scrollview.delegate=self;
    //设置最大伸缩比例
    _scrollview.maximumZoomScale=2.0;
    //设置最小伸缩比例
    _scrollview.minimumZoomScale=0.5;
}

-(void)setting
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    mySlider.maximumValue=2.0;
    mySlider.minimumValue=0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- zooming
//告诉scrollview要缩放的是哪个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageview;
}


- (IBAction)changeValue:(id)sender {
    self.scrollview.zoomScale=self.mySlider.value;
}
@end
