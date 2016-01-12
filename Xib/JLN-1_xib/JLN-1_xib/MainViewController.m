//
//  MainViewController.m
//  JLN-1_xib
//
//  Created by Jymn_Chen on 14/12/29.
//  Copyright (c) 2014年 Jymn_Chen. All rights reserved.
//

#import "MainViewController.h"

#import "RedViewOwner.h"

#import "YellowView.h"

#import "BlackViewController.h"

#import "GrayViewController.h"
#import "UIViewController+NIB.h"

@interface MainViewController ()

@property (strong, nonatomic) UIView *blueView;

@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (strong, nonatomic) RedViewOwner *redViewOwner;

@property (strong, nonatomic) YellowView *yellowView;

@property (strong, nonatomic) BlackViewController *blackViewController;

@property (strong, nonatomic) GrayViewController *grayViewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"self.view.bounds = %@", NSStringFromCGRect(self.view.bounds));
    
    /* 1. 加载xib中File's Owner为nil的视图 */
    [self loadBlueViewFromXIB];
    
    /* 2. 加载xib中File's Owner为self的视图 */
    [self loadGreenViewFromXIB];
    
    /* 3. 加载xib中File's Owner为特定类的视图 */
    [self loadRedViewFromXIB];
    
    /* 4. 加载xib文件名和视图类名一致的视图（File's Owner为nil） */
    [self loadYellowViewFromXIB];
    
    /* 5. 通过UIViewController的initWithNibName:bundle:方法加载xib文件中的视图 */
    [self loadBlackViewFromXIB];
    
    /* 6. 通过UIViewController+NIB加载xib文件中的View Controller类和其视图 */
    [self loadGrayViewFromXIB];
    
    /* 7. PurpleView.xib文件中有多个视图控件，将其全部log出来以查看xib中的视图结构 */
    [self logViewsFromXIB];
}

- (void)loadBlueViewFromXIB {
    // BlueView.xib的File's Owner为nil
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"BlueView" owner:nil options:nil];
    self.blueView = views[0];
    
    // 从xib加载进来的View大小是确定的，但是该视图在父视图中的位置是不确定的
    // 此外，视图中的子视图也是原封不动地Load进来的
    CGRect rect = _blueView.frame;
    rect.origin.x += 37.5f;
    rect.origin.y += 80.0f;
    _blueView.frame = rect;
    [self.view addSubview:_blueView];
}

- (void)loadGreenViewFromXIB {
    // GreenView.xib的File's Owner设为self，并建立了一个从该xib的View到self的IBOutlet greenView
    [[NSBundle mainBundle] loadNibNamed:@"GreenView" owner:self options:nil];
    
    // 只要self主动调用Load XIB的方法，self持有的IBOutlet指向的视图就会被初始化
    // 这里不需要通过views[0]的方式存取视图
    CGRect rect = _greenView.frame;
    rect.origin.x = _blueView.frame.origin.x;
    rect.origin.y = _blueView.frame.origin.y + 80.0f;
    _greenView.frame = rect;
    [self.view addSubview:_greenView];
}

- (void)loadRedViewFromXIB {
    // RedView.xib的File's Owner是RedViewOwner类的实例，并建立了一个从该xib的View到RedViewOwner实例的IBOutlet
    // 只要通过_redViewOwner主动调用Load XIB的方法，该IBOutlet指向的视图就会被初始化
    self.redViewOwner = [RedViewOwner new];
    [[NSBundle mainBundle] loadNibNamed:@"RedView" owner:_redViewOwner options:nil];
    
    UIView *redView = _redViewOwner.redView;
    CGRect rect = redView.frame;
    rect.origin.x = _greenView.frame.origin.x;
    rect.origin.y = _greenView.frame.origin.y + 80.0f;
    redView.frame = rect;
    [self.view addSubview:redView];
}

- (void)loadYellowViewFromXIB {
    // 说明见YellowView.m的viewFromNIB方法
    self.yellowView = [YellowView viewFromNIB];
    
    CGRect rect = _yellowView.frame;
    UIView *redView = _redViewOwner.redView;
    rect.origin.x = redView.frame.origin.x;
    rect.origin.y = redView.frame.origin.y + 80.0f;
    _yellowView.frame = rect;
    [self.view addSubview:_yellowView];
}

- (void)loadBlackViewFromXIB {
    self.blackViewController = [[BlackViewController alloc] initWithNibName:@"BlackViewController" bundle:[NSBundle mainBundle]];
    
    // 或使用Conveniece Method，但要求xib文件名和View Controller类名一致
    // self.blackViewController = [BlackViewController viewControllerFromNIB];
    
    UIView *blackView = _blackViewController.view;
    CGRect rect = blackView.frame;
    rect.origin.x = _yellowView.frame.origin.x;
    rect.origin.y = _yellowView.frame.origin.y + 80.0f;
    blackView.frame = rect;
    [self.view addSubview:blackView];
}

- (void)loadGrayViewFromXIB {
    self.grayViewController = [GrayViewController loadFromNib];
    
    UIView *grayView = _grayViewController.view;
    UIView *blackView = _blackViewController.view;
    CGRect rect = grayView.frame;
    rect.origin.x = blackView.frame.origin.x;
    rect.origin.y = blackView.frame.origin.y + 80.0f;
    grayView.frame = rect;
    [self.view addSubview:grayView];
}

- (void)logViewsFromXIB {
    NSLog(@"%s begin", __func__);
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"PurpleView" owner:nil options:nil];
    for (int i = 0; i < views.count; i++) {
        id obj = views[i];
        NSLog(@"%d : %@", i, [obj class]);
    }
    NSLog(@"%s end", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
