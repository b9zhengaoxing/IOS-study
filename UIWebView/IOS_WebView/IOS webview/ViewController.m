//
//  ViewController.m
//  IOS webview
//
//  Created by h92 on 14/12/15.
//  Copyright (c) 2014年 李腾飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- 中国 本地方法两个

- (IBAction)testLoadHTMLString:(id)sender {
    NSString *htmlPath=[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    //资源目录
    NSURL *bundleUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error=nil;

    //将文件 读入nsstring 对象中
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding: NSUTF8StringEncoding error:&error];

    if(error==nil)
    {
        //baseURL :主页文件基本路径——资源目录 ——用NSURL获取
        [self.webView loadHTMLString:html baseURL:bundleUrl];
    }
    
}

- (IBAction)textLoadData:(id)sender {
    //地址
    NSString *htmlPath =[[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    //获取资源目录
    NSURL *bundleUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error=nil;
    
    //数据读入NSdate对象
    NSData *htmlData=[[NSData alloc] initWithContentsOfFile:htmlPath];
    
    if (error==0) {
        [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:bundleUrl];
    }
}



#pragma mark -- 英国 web网络方法一个
- (IBAction)testLoadRequest:(id)sender {
    
    // 严格制定网址
    NSURL * url = [NSURL URLWithString: @"http://www.qq.com"];
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
  //  self.webView.delegate = self;
    
}



#pragma mark -- UIWebViewDelegate委托定义方法
- (void)webViewDidFinishLoad: (UIWebView *) webView {
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:
                  @"document.body.innerHTML"]);
}
@end
