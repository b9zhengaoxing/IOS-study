//
//  SectionTableViewController.m
//  IOS table1 type
//
//  Created by h92 on 15/1/6.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "SectionTableViewController.h"
#import "DefineA.h"

@interface SectionTableViewController ()<UITableViewDataSource>

@end

@implementation SectionTableViewController
@synthesize dicData;
@synthesize arrayListName;

- (void)viewDidLoad {
    [super viewDidLoad];
        [self initView];

}




/*--------------------------------------初始化---------------------------------------*/
-(void)initView
{
    // 获取文件路径
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plist=[bundle pathForResource:@"team_dictionary" ofType:@"plist"];
    
    // 读取文件数据（nsdictionary 类型）
    dicData=[[NSDictionary alloc] initWithContentsOfFile:plist];
    NSArray *arrayTmp=[dicData allKeys];
    // sort 种类方式，将***分类
    self.arrayListName=[arrayTmp sortedArrayUsingSelector:@selector(compare:)];
    
    // 设置title
    self.title=SECTIONTABLETITLE;
    
    [self.tableView setBackgroundColor:[UIColor blackColor]];
}

/*--------------------------------------班级点名---------------------------------------*/

// 一共有几组？
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrayListName count];
}

// 组长是谁？
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [arrayListName objectAtIndex:section];
}


// 第几组有几个人
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return [[dicData objectForKey:[arrayListName objectAtIndex:section]] count];
}


// 他们都叫什么
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 确定Cell标识
    static NSString *cellIdentifier=@"Cell";
    // 复用 Cell
    // 小译：（某X） 使用标识列出可以复用的单元格：某标识
//    - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 列出文本
    NSString *stringTmp=[arrayListName objectAtIndex:indexPath.section];
    cell.textLabel.text=[[dicData objectForKey:stringTmp] objectAtIndex:indexPath.row];
    
    //错误原因:contentView自动适配了safeArea
//    [cell.contentView setBackgroundColor:[UIColor blueColor]];
    
    [cell.backgroundView setBackgroundColor:[UIColor blueColor]];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - iPhone6X 适配

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView * header = (UITableViewHeaderFooterView*)view;
    UIFont  * font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    UIColor * color = [UIColor greenColor];
    
    [header.textLabel setFont:font];
    
    //错误原因:contentView自动适配了safeArea
//    [header.contentView setBackgroundColor:color];
    
    [header.backgroundView setBackgroundColor:color];
}



@end
