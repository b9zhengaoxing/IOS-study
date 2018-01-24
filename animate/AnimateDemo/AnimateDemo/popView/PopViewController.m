//
//  PopViewController.m
//  AnimateDemo
//
//  Created by 李腾飞 on 2017/11/17.
//  Copyright © 2017年 李腾飞. All rights reserved.
//

#import "PopViewController.h"

#define MiTingGuideWidth        446/2
#define MiTingGuideHeight       122/2
#define MiTingGuideRightMargin  6/2
#define MiTingGuideTopMargin    117/2
#define kMiTingGuideViewTag     2017041110

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- action

/**
 点击弹窗upDown

 @param sender  UIButton
 */
- (IBAction)showInPoint:(id)sender {
    
    UIButton *tipBtn = (UIButton*)sender;
    CGPoint tipBtnOrigin = CGPointMake(CGRectGetWidth(self.view.frame)- MiTingGuideWidth-MiTingGuideRightMargin, MiTingGuideTopMargin + CGRectGetHeight(tipBtn.frame));
    
    [self createMiTingGuideView:tipBtnOrigin];
    
    UIView *mtGuideBtn = [self.view viewWithTag:kMiTingGuideViewTag];
    [self showPopAnimationUpdown:mtGuideBtn];
}


/**
 Direct

 @param sender <#sender description#>
 */
- (IBAction)showInPiontDirect:(id)sender {
    UIButton *tipBtn = (UIButton*)sender;
    CGPoint tipBtnOrigin = CGPointMake(CGRectGetWidth(self.view.frame)- MiTingGuideWidth-MiTingGuideRightMargin, MiTingGuideTopMargin + CGRectGetHeight(tipBtn.frame));
    
    [self createMiTingGuideView:tipBtnOrigin];
    
    UIView *mtGuideBtn = [self.view viewWithTag:kMiTingGuideViewTag];
    [self showPopAnimation:mtGuideBtn];
}

#pragma mark -- Animate

/**
 上线颤动,动画

 @param aView <#aView description#>
 */
- (void)showPopAnimationUpdown:(UIView*)aView {
    //展示动画
    CGRect des_frame = aView.frame;
    CGPoint a_point = CGPointMake(1, 0);
    aView.alpha = 0.0;
    aView.layer.anchorPoint = a_point;
    aView.layer.position = CGPointMake(des_frame.origin.x+a_point.x*des_frame.size.width, des_frame.origin.y+a_point.y*des_frame.size.height);
    aView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        aView.transform = CGAffineTransformMakeScale(1.02, 1.02);
        aView.alpha = 1.;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            aView.transform = CGAffineTransformMakeScale(0.98, 0.98);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                aView.transform = CGAffineTransformMakeScale(1.01, 1.01);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                    aView.transform = CGAffineTransformMakeScale(0.99, 0.99);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                        aView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                    } completion:nil];
                }];
            }];
        }];
    }];
}

/**
 展开动画
 
 @param aView <#aView description#>
 */
- (void)showPopAnimation:(UIView*)aView {
    //展示动画
    CGRect des_frame = aView.frame;
    CGPoint a_point = CGPointMake(0.5, 0.5); //控制位置
    aView.alpha = 0.0;
    aView.layer.anchorPoint = a_point;
    aView.layer.position = CGPointMake(des_frame.origin.x+a_point.x*des_frame.size.width, des_frame.origin.y+a_point.y*des_frame.size.height);
    aView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        aView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        aView.alpha = 1.;
    } completion:^(BOOL finished) {
        //啥也没干
    }];
}


#pragma mark -- 初始化方法

- (void)createMiTingGuideView:(CGPoint)tipBtnOrigin
{
    UIButton *mtGuideTipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mtGuideTipBtn.frame = CGRectMake(tipBtnOrigin.x, tipBtnOrigin.y, MiTingGuideWidth, MiTingGuideHeight);
    mtGuideTipBtn.backgroundColor = [UIColor clearColor];
    [mtGuideTipBtn setImage:[UIImage imageNamed:@"push_miting_guide_iphone.png"] forState:UIControlStateNormal];
    [mtGuideTipBtn addTarget:self action:@selector(removeMiTingGuideView) forControlEvents:UIControlEventTouchUpInside];
    mtGuideTipBtn.tag = kMiTingGuideViewTag;
    
    [self.view addSubview:mtGuideTipBtn];
    [self.view bringSubviewToFront:mtGuideTipBtn];
    
    //10秒后自动消失
    [self performSelector:@selector(removeMiTingGuideView) withObject:self afterDelay:10];
}

-(void)removeMiTingGuideView{
    UIView *mtGuideBtn = [self.view viewWithTag:kMiTingGuideViewTag];
    if (mtGuideBtn && [mtGuideBtn isKindOfClass:[UIButton class]]) {
        [UIView animateWithDuration:0.35 animations:^{
            mtGuideBtn.alpha = 0.0;
            mtGuideBtn.transform = CGAffineTransformMakeScale(0.3, 0.3);
            
        } completion:^(BOOL finished) {
            if (mtGuideBtn) {
                if ([mtGuideBtn superview]) {
                    [mtGuideBtn removeFromSuperview];
                }
            }
        }];
    }
}

@end
