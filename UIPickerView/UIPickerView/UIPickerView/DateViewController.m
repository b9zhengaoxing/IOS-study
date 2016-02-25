//
//  DateViewController.m
//  UIPickerView
//
//  Created by tengfei li on 25/2/16.
//  Copyright © 2016年 LYD. All rights reserved.
//

#import "DateViewController.h"

@implementation DateViewController

- (IBAction)onClick:(id)sender {
    NSDate * theDate = self.datePick.date;
    NSLog(@"the date picked is: %@", [theDate descriptionWithLocale:[NSLocale currentLocale]]);
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
    dateFormatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSLog(@"the date formate is: %@", [dateFormatter stringFromDate:theDate]);
    self.label.text = [dateFormatter stringFromDate:theDate];
}
@end
