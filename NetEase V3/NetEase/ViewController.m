//
//  ViewController.m
//  NetEase
//
//  Created by dllo on 16/1/17.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIButton *button;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewHeadLine;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollForHeadImage;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createScrollerForHeadLine];
}


- (void)createScrollerForHeadLine{

    self.scrollViewHeadLine.contentSize = CGSizeMake(600, 35);
    
    self.scrollViewHeadLine.pagingEnabled = YES;
    NSMutableArray *arr = @[@"头条", @"娱乐", @"热点", @"体育", @"大连", @"音乐"].mutableCopy;
    for (int i = 0; i < arr.count; i ++) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(74*i + 15, 10, 40, 20);
        [self.button setTitle:arr[i] forState:UIControlStateNormal];
        self.button.backgroundColor = [UIColor clearColor];
        [self.button addTarget:self action:@selector(pressAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollViewHeadLine addSubview:self.button];

    }
}

- (void)pressAction:(UIButton *) button{
    NSLog(@"ddd");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
