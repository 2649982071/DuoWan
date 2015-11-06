//
//  TuWanHtmlController.m
//  BaseProject
//
//  Created by ios－07 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlController.h"
#import "Factory.h"

@interface TuWanHtmlController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;
@end

@implementation TuWanHtmlController
- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}


- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
}
#pragma mark - UIWebView Delegat

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
}

@end
