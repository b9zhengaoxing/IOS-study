//
//  CustomTableViewController.m
//  IOS table1 type
//
//  Created by 李腾飞 on 15/1/24.
//  Copyright (c) 2015年 李腾飞. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"

@interface CustomTableViewController ()<UITableViewDataSource>

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    CustomTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.name.text=@"科比";
    cell.age.text=@"37";
    cell.phone.text=@"男";
    cell.image.image=[UIImage imageNamed:@"Kobe.png"];
    return cell;
}




@end
