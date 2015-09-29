//
//  ProgrammingViewController.m
//  IOS_layout
//
//  http://www.itstrike.cn/Question/f27a22d6-15bc-4c42-8a49-27bbf64d2068.html
//  http://www.th7.cn/Program/IOS/201407/230145.shtml

#import "ProgrammingViewController.h"

@interface ProgrammingViewController ()

@end

@implementation ProgrammingViewController
@synthesize tmpLabel;
@synthesize tmpView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    [self addLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addView
{
    // build view
    tmpView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200,200)];
    tmpView.backgroundColor=[UIColor greenColor];

    //Returns a Boolean value that indicates whether the view’s autoresizing mask is translated into constraints for the constraint-based layout system.
    //    If this is value is YES, the view’s superview looks at the view’s autoresizing mask, produces constraints that implement it, and adds those constraints to itself (the superview).
    //    Returns YES if the view’s autoresizing mask is translated into constraints for the constraint-based layout system, NO otherwise.
    tmpView.translatesAutoresizingMaskIntoConstraints=NO;

    [self.view addSubview:tmpView];

    // leading
    NSLayoutConstraint *myConstraint2=[NSLayoutConstraint
                                       constraintWithItem:tmpView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0f
                                       constant:20.0f];
    [self.view addConstraint:myConstraint2];
    
    // top
    myConstraint2=[NSLayoutConstraint
                   constraintWithItem:tmpView
                   attribute:NSLayoutAttributeTop
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.view
                   attribute:NSLayoutAttributeTop
                   multiplier:1.0f
                   constant:100.0f];
    [self.view addConstraint:myConstraint2];
    
    // trailing
    myConstraint2=[NSLayoutConstraint
                   constraintWithItem:tmpView
                   attribute:NSLayoutAttributeTrailing
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.view
                   attribute:NSLayoutAttributeTrailing
                   multiplier:1.0f
                   constant:-20.0f];
    [self.view addConstraint:myConstraint2];
    
    // bottom
    myConstraint2=[NSLayoutConstraint
                   constraintWithItem:tmpView
                   attribute:NSLayoutAttributeBottom
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.view
                   attribute:NSLayoutAttributeBottom
                   multiplier:1.0f
                   constant:-20.0f];
    [self.view addConstraint:myConstraint2];

}

-(void)addLabel
{
    tmpLabel=[[UILabel alloc]init];
    tmpLabel.text=@"屏幕1";
    [self.view addSubview:tmpLabel];
    tmpLabel.translatesAutoresizingMaskIntoConstraints=NO;
    
    // leading
    NSLayoutConstraint *myConstraint2=[NSLayoutConstraint
                                       constraintWithItem:tmpLabel
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                       constant:-20.0f];
    [self.view addConstraint:myConstraint2];
    
    // align
    myConstraint2=[NSLayoutConstraint
                   constraintWithItem:tmpLabel
                   attribute:NSLayoutAttributeCenterX
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.view
                   attribute:NSLayoutAttributeCenterX
                   multiplier:1.0f
                   constant:0.0f];
    [self.view addConstraint:myConstraint2];
    
}


@end
