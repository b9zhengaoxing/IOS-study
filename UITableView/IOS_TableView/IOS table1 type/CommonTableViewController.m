//
//  CommonTableViewController.m
//  IOS table1 type
//
//  Created by h92 on 15/1/6.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "CommonTableViewController.h"
#import "Jump1ViewController.h"
#import "Jump2ViewController.h"
#import "DefineA.h"

@interface CommonTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation CommonTableViewController
@synthesize dataList;
@synthesize table;
@synthesize flowButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}


/*--------------------------------------初始化---------------------------------------*/
-(void)initView
{
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup
{
//  添加悬浮按钮
    flowButton=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 30, 30) ];
    [flowButton setImage:[UIImage imageNamed:@"flowButton"] forState:UIControlStateNormal];
    [self.tableView addSubview:flowButton];
    [self.tableView bringSubviewToFront:flowButton];
    buttonY=(int)flowButton.frame.origin.y;
    
    // 获取文件路径
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plist=[bundle pathForResource:@"team" ofType:@"plist"];
    
    // 读取文件数据（nsdictionary 类型）
    dataList=[[NSMutableArray alloc] initWithContentsOfFile:plist];
    
    // 设置title
    self.title=COMMOMTABLETITLE;
}


#pragma mark-dataSource method
/*--------------------------------------班级点名---------------------------------------*/
// 第几组有几个人
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [dataList count];
}


// 他们都叫什么
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 确定Cell标识
    static NSString *cellIdentifier=@"Cell";
    
    // 复用 Cell
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
        //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];

    }
    cell.detailTextLabel.text=@"这就是副标题";

    
    // 球队名称
    cell.textLabel.text=[[dataList objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    
    // 根据plist文件生成 字符串
    NSString *imagePath=[[[dataList objectAtIndex:indexPath.row]objectForKey:@"image"] stringByAppendingString:@".png"];
    
    
    // 根据字符串加载图片
    cell.imageView.image=[UIImage imageNamed:imagePath];
//    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
//    cell.accessoryType=UITableViewCellAccessoryDetailButton;
//    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark- tableView Delegate
//  通过storyboard 实现跳转 http://www.cnblogs.com/zhangdadi/archive/2012/12/03/2799816.html
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",(int)indexPath.row);
    if (indexPath.row%2==0) {
//        UIViewController *next = [[self storyboard] instantiateViewControllerWithIdentifier:@"IconView"];
        Jump1ViewController *vc=[[self storyboard]instantiateViewControllerWithIdentifier:@"jump1"];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        Jump2ViewController *vc=[[self storyboard]instantiateViewControllerWithIdentifier:@"jump2"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark- 添加悬浮窗口
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%d",(int)flowButton.frame.origin.y);
    flowButton.frame = CGRectMake(flowButton.frame.origin.x, buttonY+self.tableView.contentOffset.y , flowButton.frame.size.width, flowButton.frame.size.height);
}





@end
