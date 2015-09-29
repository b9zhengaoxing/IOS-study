//
//  ViewController.m
//  text
//
//  Created by Bc_Ltf on 15/2/27.
//  Copyright (c) 2015年 Bc_Ltf. All rights reserved.
//

#import "ViewController.h"
#define WEIGHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController
@synthesize topDisplayScroller;
@synthesize page;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTopIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- 创建主页上方滑动视图
/*
 *  原理：创建一个分page的，scrollView , 在创建一个浮在上面的pageController————滑动展示
 */
-(void)createTopIndex
{
    topDisplayScroller.contentSize=CGSizeMake(WEIGHT*5, topDisplayScroller.frame.size.height);
    topDisplayScroller.pagingEnabled=YES;//允许分页滑动
    
    for (int i=0; i<5; i++) {
        UIImageView *ImagePage=[[UIImageView alloc]initWithFrame:CGRectMake(WEIGHT*i, 0, WEIGHT, topDisplayScroller.frame.size.height)];
        ImagePage.image=[UIImage imageNamed:@"1"];
        [topDisplayScroller addSubview:ImagePage];
    }
    /*
     *  注明：添加pageControl，但是不能添加到scroller的内容视图上，为啥呢？因为添加到上面去以后pageControl会随之滑动
     */
    page=[[UIPageControl alloc]initWithFrame:CGRectMake(WEIGHT/6, 20+topDisplayScroller.frame.size.height*2/3, 50, 20)];
    page.numberOfPages=5;
    page.currentPageIndicatorTintColor=[UIColor orangeColor];
    page.pageIndicatorTintColor=[UIColor whiteColor];
    [self.page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:page];
}

/*
 *  功能：滑动scroller，带动pageControl
 */

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset=scrollView.contentOffset;
    self.page.currentPage=offset.x/WEIGHT;
}

/*
 *  功能：点击pageControll，动画
 */
- (void)changePage:(id)sender
{
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage = self.page.currentPage;
        topDisplayScroller.contentOffset = CGPointMake(WEIGHT* whichPage, 0.0f);
    }];
}

@end
