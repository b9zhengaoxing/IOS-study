//
//  CustomTableViewCell.h
//  IOS table1 type
//
//  Created by 李腾飞 on 15/1/24.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *phone;

#pragma mark- Cell 上的引导
//    1. 指向Button —— 根据切图
//    2. 随着随着TableView滚动 —— 添加SuperView的时机：didMoveSuperView
//    3. 见《自定义而Cell》

/**
 *	@add by litengfei
 *
 *	@brief	是否展示点击引导图
 */
@property (nonatomic,assign) BOOL isShowGuideView;

/**
 *	@add by litengfei
 *
 *	@brief	引导视图
 */
@property (nonatomic,retain) UIImageView *guideView;

@end
