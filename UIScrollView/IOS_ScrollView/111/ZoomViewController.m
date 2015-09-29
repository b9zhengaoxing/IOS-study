//
//  ZoomViewController.m
//  111
//
//  Created by Maculish Ting on 13/7/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//  参考：http://www.cnblogs.com/wendingding/p/3754268.html
//

#import "ZoomViewController.h"

@interface ZoomViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollview;
    UIImageView *_imageview;
}

@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1添加 UIScrollView
    //设置 UIScrollView的位置与屏幕大小相同
    _scrollview=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollview];
    
    //2添加图片
    //有两种方式
    //(1)一般方式
    //    UIImageView  *imageview=[[UIImageView alloc]init];
    //    UIImage *image=[UIImage imageNamed:@"minion"];
    //    imageview.image=image;
    //    imageview.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    
    
    //(2)使用构造方法
    UIImage *image=[UIImage imageNamed:@"1.jpg"];
    _imageview=[[UIImageView alloc]initWithImage:image];
    
    //加上几个 测试试图
    UIView *text1=[[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    text1.backgroundColor=[UIColor redColor];
    [_imageview addSubview:text1];
    
    UIView *text2=[[UIView alloc] initWithFrame:CGRectMake(220, 20, 100, 100)];
    text2.backgroundColor=[UIColor redColor];
    [_imageview addSubview:text2];
    
    
    //调用initWithImage:方法，它创建出来的imageview的宽高和图片的宽高一样
    [_scrollview addSubview:_imageview];
    
    //设置UIScrollView的滚动范围和图片的真实尺寸一致
    _scrollview.contentSize=image.size;
    
    
    //设置实现缩放
    //设置代理scrollview的代理对象
    _scrollview.delegate=self;
    //设置最大伸缩比例
    _scrollview.maximumZoomScale=2.0;
    //设置最小伸缩比例
    _scrollview.minimumZoomScale=0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//告诉scrollview要缩放的是哪个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageview;
}




@end
