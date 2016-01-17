//
//  ViewController.m
//  UI_抓包
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "PhotoOfhead.h"
#import "NetWorkHandler.h"
#import "ModelOfPag1.h"
#import "CellOfContect.h"
#import "UIImageView+WebCache.h"
#import "SecondViewController.h"
#import "contentOfNews.h"


@interface ViewController ()<networkHandlerDelegate,UITableViewDataSource, UITableViewDelegate,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) NSMutableArray *arrOfNewsImages;
@property (nonatomic, retain) NSMutableDictionary *dicOfHeadImage;
@property (nonatomic, retain) ModelOfPag1 *model;
@property (nonatomic, retain) UILabel *titleOflabel;
@property (nonatomic, retain) NSMutableArray *arrOfheadImage;
@property (nonatomic, retain) PhotoOfhead *photo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self createTableView];
    [self createNavigationItems];
}


- (void)handleData{

    NSString *url = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html";
    [NetWorkHandler handlerJSONWithURL:url delegate:self];
}


// 实现协议方法

- (void)handleDidComplete:(id)resule{
    
    // 大字典中的数组
    NSArray *arr = [resule objectForKey:@"T1348647853363"];
    
    /** 初始化数组用于存放 model*/
    self.arr = [NSMutableArray array];
    for (NSMutableDictionary *dic in arr) {
        
       ModelOfPag1 *model = [[ModelOfPag1 alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        [self.arr addObject:model];
        
    }

    
    self.arrOfheadImage = [NSMutableArray array];
    
    for (NSDictionary *dicOfHeadImage in arr) {
            NSMutableArray *array = [dicOfHeadImage objectForKey:@"ads"];
        
        for (NSDictionary *dicData in array) {
            [self.arrOfheadImage addObject:[dicData objectForKey:@"imgsrc"]];
        }
    }
    
    [self.photo passArrOfImages:self.arrOfheadImage];

    [self.tableView reloadData];
    
}



//导航栏控制

- (void)createNavigationItems{

    /** 右侧搜索,时间 */
    UIBarButtonItem *itemOfLeft = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"surcher"] style:UIBarButtonItemStylePlain target:self action:@selector(surcherAction:)];
    
    UIBarButtonItem *itemOfRight = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"time"] style:UIBarButtonItemStylePlain target:self action:@selector(timeAction:)];
    self.navigationItem.rightBarButtonItems = @[itemOfRight, itemOfLeft];
    
   // self.navigationItem.title = @"網易新聞";
    
    self.titleOflabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 44, 60, 20)];
    self.titleOflabel.backgroundColor = [UIColor clearColor];
    self.titleOflabel.font = [UIFont boldSystemFontOfSize:20];
    //设置文本字体与大小
    self.titleOflabel.textColor = [UIColor whiteColor];
    
    //设置文本颜色 UITextAlignmentLeft 替代为 NSTextAlignmentLeft
    self.titleOflabel.text = @"網易新聞";
    self.titleOflabel.textAlignment = NSTextAlignmentLeft;
    
   // button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft
    //self.titleOflabel.contentHorizontalAlignment = UIControlContentHorizonAlignmentLeft
    
    //设置标题
    
    self.navigationItem.titleView = self.titleOflabel;
    
    /** UINavigationBar 背景颜色 */
    
    //获取bar
    UINavigationBar *bar = self.navigationController.navigationBar;
    //背景颜色
    bar.barTintColor = [UIColor redColor];
    //文字颜色
    bar.tintColor = [UIColor whiteColor];
    
}

- (void)surcherAction:(UIButton *)button{
    NSLog(@"搜索点击事件");
}
- (void)timeAction:(UIButton *)button{
    NSLog(@"时间按钮点击事件");
}

//tableView 创建

- (void)createTableView{

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    /** 图片轮播图 */
    [self createScrollViewOfHeadImages];
    
    [self.tableView registerClass:[CellOfContect class] forCellReuseIdentifier:@"pool1"];
}


/** 轮播头图 */

- (void)createScrollViewOfHeadImages{
    
    self.photo = [[PhotoOfhead alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,240)];
    self.tableView.tableHeaderView = self.photo;
}



/** tableView协议方法 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CellOfContect *cellOfNews= [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    ModelOfPag1 *model = [self.arr objectAtIndex:indexPath.row];
    
  
     [cellOfNews passModel:model];
    
    return cellOfNews;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 110;
}



/** 点击 cell 跳转页面*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecondViewController *second = [[SecondViewController alloc] init];
    
    ModelOfPag1 *model = [self.arr objectAtIndex:indexPath.row];
    
    second.model = model;
    
    [self.navigationController pushViewController:second animated:YES];

}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
