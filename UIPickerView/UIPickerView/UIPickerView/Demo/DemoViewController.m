//
//  DemoViewController.m
//  UIPickerView
//
//  Created by tengfei li on 12/1/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "DemoViewController.h"
#define singerPickerView 0
#define singPickerView 1

@interface DemoViewController ()
{
    //    储存第一个选取器的的数据
    NSArray *singerData;
    //    储存第二个选取器
    NSArray *singData;
    //    读取plist文件数据
    NSDictionary *pickerDictionary;
}

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setting];
    
    // 设置默认选中
    [self.pickerView selectRow:4 inComponent:0 animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    //  关闭时清空数据
    pickerDictionary=nil;
    singData=nil;
    singerData=nil;
    
}

- (void)setting
{
    //    获取mainBundle
    NSBundle *bundle = [NSBundle mainBundle];
    //    获取songInfo.plist文件路径
    NSURL *songInfo = [bundle URLForResource:@"songInfo" withExtension:@"plist"];
    //    把plist文件里内容存入数组
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfURL:songInfo];
    pickerDictionary=dic;
    //    将字典里面的内容取出放到数组中
    NSArray *components = [pickerDictionary allKeys];
    
    //选取出第一个滚轮中的值
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    
    singerData = sorted;
    
    //    根据第一个滚轮中的值，选取第二个滚轮中的值
    NSString *selectedState = [singerData objectAtIndex:0];
    NSArray *array = [pickerDictionary objectForKey:selectedState];
    singData=array;
    
    //   禁用UITextField编辑
    _singTextField.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)buttonPressed:(id)sender {
    //    获取选取器某一行索引值
    NSInteger singerrow =[self.pickerView selectedRowInComponent:singerPickerView];
    NSInteger singrow = [self.pickerView selectedRowInComponent:singPickerView];
    //   将singerData数组中值取出
    NSString *selectedsinger = [singerData objectAtIndex:singerrow];
    NSString *selectedsing = [singData objectAtIndex:singrow];
    NSString *message = [[NSString alloc] initWithFormat:@"你选择了%@的%@",selectedsinger,selectedsing];
    

    //IOS9中改为了AlertController
    //    http://www.ithao123.cn/content-9409772.html
    
    // 初始化一个一个UIAlertController
    // 参数preferredStyle:是IAlertController的样式
    // UIAlertControllerStyleAlert 创建出来相当于UIAlertView
    // UIAlertControllerStyleActionSheet 创建出来相当于 UIActionSheet
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"提示"
                                          message:message
                                          preferredStyle:(UIAlertControllerStyleAlert)];
    
    // 创建按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        NSLog(@"确定");
    }];
    // 创建按钮
    // 注意取消按钮只能添加一个
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        // 点击按钮后的方法直接在这里面写
        NSLog(@"取消");
    }];
    
    // 添加按钮 将按钮添加到UIAlertController对象上
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    // 将UIAlertController模态出来 相当于UIAlertView show 的方法
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Date Source Methods

//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //    返回几就有几个选取器
    return 2;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component==singerPickerView) {
        return [singerData count];
    }
    
    return [singData count];
    
}
#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==singerPickerView) {
        return [singerData objectAtIndex:row];
    }
    
    return [singData objectAtIndex:row];
    
    
}

-(void)pickerView:(UIPickerView *)pickerViewt didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //    如果选取的是第一个选取器
    if (component == singerPickerView) {
        //        得到第一个选取器的当前行
        NSString *selectedState =[singerData objectAtIndex:row];
        
        //        根据从pickerDictionary字典中取出的值，选择对应第二个中的值
        NSArray *array = [pickerDictionary objectForKey:selectedState];
        singData=array;
        [self.pickerView selectRow:0 inComponent:singPickerView animated:YES];
        
        
        //        重新装载第二个滚轮中的值
        [self.pickerView reloadComponent:singPickerView];
    }
    [self setTextField];
}



//设置滚轮的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == singerPickerView) {
        return 120;
    }
    return 200;
}

#pragma mark 在textField中显示数值
- (void)setTextField
{
    //    获取选取器某一行索引值
    NSInteger singerrow =[self.pickerView selectedRowInComponent:singerPickerView];
    NSInteger singrow = [self.pickerView selectedRowInComponent:singPickerView];
    //   将singerData数组中值取出
    NSString *selectedsinger = [singerData objectAtIndex:singerrow];
    NSString *selectedsing = [singData objectAtIndex:singrow];
    [self.singTextField setText:[NSString stringWithFormat:@"%@-%@",selectedsinger,selectedsing]];
    

}

@end
