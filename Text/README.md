# NSString
## 大小写
```
NSString *student           = @"student";
NSString *studentUp         = [student uppercaseString];    //大写
NSString *studentUpFirst    = [student capitalizedString];  //开头大写，其余小写
     
NSString *TEACHER           = @"TEACHER";
NSString *TEACHERLower      = [TEACHER lowercaseString];    //小写
NSString *TEACHERUpFirst    = [TEACHER capitalizedString];  //开头大写，其余小写
     
NSLog(@"原student:%@",student);
NSLog(@"大写student:%@",studentUp);
NSLog(@"开头大写student:%@",studentUpFirst);
NSLog(@"\n");
NSLog(@"原TEACHER:%@",TEACHER);
NSLog(@"小写TEACHER:%@",TEACHERLower);
NSLog(@"开头大写TEACHER:%@",TEACHERUpFirst);

```

# NSAttributeString

[NSAttributeString](http://blog.csdn.net/wenluma/article/details/12838983)

```
NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];  

[ps setAlignment:NSTextAlignmentCenter]; 

NSDictionary *attri = @{ 
                        NSForegroundColorAttributeName:[SubTitleModelViewController ColorFromInt:model.FontColor],
                        NSBackgroundColorAttributeName:[SubTitleModelViewController ColorFromInt:model.BKColor],
                        NSParagraphStyleAttributeName:ps，
                        };
NSString *string = model.Content;
NSRange range = NSMakeRange(0, string.length);


NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:string];
[attriString addAttributes:attri range:range];

_tmpSubTitle.editField.font = [UIFont fontWithName:model.FontName size:(float)model.FontSize];

_tmpSubTitle.editField.attributedText = [[NSAttributedString alloc] initWithAttributedString:attriString];


self.richTextView.backgroundColor = [self.richTextView.typingAttributes objectForKey:@"NSBackgroundColor"];

```







# NSFont

## FontName Size


```
IOS开发的字体大小设置有几种方法：
UIFont *font = [UIFont fontWithName:(NSString *) size:(CGFloat)];//字体名，和大小来初始化。

UIFont *font = [UIFont fontNamesForFamilyName:(NSString*)];//从设备支持的字体的名字中选择。

UIFont *font = [UIFont systemFontOfSize:(CGDloat)];//通过字体大小来设置字体

UIFont *font = [UIFont boldSystemFontOfSize:(CGFloat)];//默认大小粗体字

```

# UITextField
# UITextView
[UITextField](http://www.cnblogs.com/chenxiangxi/p/3642576.html)



