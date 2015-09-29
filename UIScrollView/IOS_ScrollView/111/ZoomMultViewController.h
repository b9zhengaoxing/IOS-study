//
//  ZoomMultViewController.h
//  111
//
//  Created by Maculish Ting on 13/7/15.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomMultViewController : UIViewController

//background
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
//scrollView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
//slider
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
//拖动slider
- (IBAction)changeValue:(id)sender;

@end
