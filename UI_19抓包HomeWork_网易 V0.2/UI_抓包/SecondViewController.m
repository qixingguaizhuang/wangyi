//
//  SecondViewController.m
//  UI_抓包
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "ModelOfPag1.h"

@interface SecondViewController ()

@property (nonatomic, retain)UIWebView *webView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self creatWebView];
    [self createNavigation];
}



- (void)creatWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:self.model.url];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

}


- (void)createNavigation{
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mark"] style:UIBarButtonItemStylePlain target:self action:nil];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
