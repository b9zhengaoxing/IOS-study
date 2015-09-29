//
//  CellTableViewController.m
//  IOS table1 type
//
//  Created by Bc_Ltf on 15/1/22.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "CellTableViewController.h"
#import "DefineA.h"

@interface CellTableViewController ()

@end

@implementation CellTableViewController
@synthesize dataList;
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*--------------------------------------初始化---------------------------------------*/
-(void)initView
{
    // 获取文件路径
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plist=[bundle pathForResource:@"team" ofType:@"plist"];
    
    // 读取文件数据（nsdictionary 类型）
    dataList=[[NSMutableArray alloc] initWithContentsOfFile:plist];
    
    // 设置title
    self.title=SOMECELL;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [dataList count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 确定Cell标识
    static NSString *cellIdentifier=@"Cell";
    static int i=0;
    UITableViewCellStyle style;
    NSString *cellType;
    switch (indexPath.row % 4)
    {
        case 0:
            style = UITableViewCellStyleDefault;
            cellType = @"Default Style";
            //有标题没有正文（没有细节文字）。可选的图片
            break;
        case 1:
            style = UITableViewCellStyleSubtitle;
            cellType = @"Subtitle Style";
            //标题和正文方式，上下排布。可选的图片
            break;
        case 2:
            style = UITableViewCellStyleValue1;
            cellType = @"Value1 Style";
            //左边文字左对齐，右边文字右对齐。可选的图片
            break;
        case 3:
            style =  UITableViewCellStyleValue2;
            cellType =  @"Value2 Style";
            //左边文字右对齐，蓝色；右边文字左对齐，黑色。没有图片
            break;
            
    }
    
    // 复用 Cell
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellType];
    if(cell==nil){
        i++;
        cell=[[UITableViewCell alloc]initWithStyle:style reuseIdentifier:cellType];
        NSLog(@"cell创建了%i次",i);
    }
        // 球队名称
    cell.detailTextLabel.text=@"我是副标题";
    cell.textLabel.text=[[dataList objectAtIndex:indexPath.row] objectForKey:@"name"];
    // 根据plist文件生成 字符串
    NSString *imagePath=[[[dataList objectAtIndex:indexPath.row]objectForKey:@"image"] stringByAppendingString:@".png"];
    // 根据字符串加载图片
    cell.imageView.image=[UIImage imageNamed:imagePath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 152;
}

@end
