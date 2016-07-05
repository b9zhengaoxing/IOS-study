//
//  CustomTableViewCell.m
//  IOS table1 type
//
//  Created by 李腾飞 on 15/1/24.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark- Cell 上的引导
//    1. 指向Button —— 根据切图
//    2. 随着随着TableView滚动 —— 添加SuperView的时机：didMoveSuperView
//    3. 见《自定义而Cell》

- (void)didMoveToSuperview
{
//    1. 调用时机：Cell加入父视图
    self.isShowGuideView = YES;
}

#pragma mark GuideView method
/**
 *  @ 判断是否展示引导视图
 *  @ YES 展示
 *  @ NO 不展示
 */
- (void)setIsShowGuideView:(BOOL)isShowGuideView
{
    _isShowGuideView = isShowGuideView;
    if(!isShowGuideView)
    {
        if(_guideView)
        {
            [_guideView.layer removeAllAnimations];
            [_guideView removeFromSuperview];
            _guideView = nil;
        }
    }
    else
    {
        [self createGuideView];
        //摇晃引导图
        [self shakeImage];
        //五秒后引导图消失
        [self performSelector:@selector(setIsShowGuideView:) withObject:NO afterDelay:500.f];
    }
}


/**
 *  @ 创建引导视图
 *  @ 视图仅仅展示一次
 *  @ 3秒钟之后销毁
 *  @ 点击订阅也销毁
 */
- (UIImageView *)createGuideView
{
//    1. 根据文字多少创建UILabel
//    2. 根据Label创建提示框
//    3. 提示框的中心指向
    
    if(!_guideView)
    {
        // 转换坐标系
        CGRect rectLabel = [self convertRect:self.name.frame toView:self.superview];
        //
        _guideView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"subScribe_guide_describe_down"]];
        _guideView.frame = CGRectMake(rectLabel.origin.x, rectLabel.origin.y - 10 - _guideView.frame.size.height, _guideView.frame.size.width, _guideView.frame.size.height);
        [self.superview addSubview:_guideView];
        [self.superview bringSubviewToFront:_guideView];
    }
    return _guideView;
}

/**
 *  @ 上下摇晃引导图
 */
- (void)shakeImage
{
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat|UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _guideView.center = CGPointMake(_guideView.center.x, _guideView.center.y+5);
        
    } completion:^(BOOL finished) {
        
    }];
    
}



@end
