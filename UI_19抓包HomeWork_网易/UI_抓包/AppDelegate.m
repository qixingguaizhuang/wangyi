//
//  AppDelegate.m
//  UI_抓包
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VCForItem2.h"
#import "VCForItem3.h"
#import "VCForItem4.h"
#import "VCForItem5.h"



@interface AppDelegate ()

@property (nonatomic, retain)UITabBarController *tbc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    self.tbc.tabBar.tintColor = [UIColor redColor];
    
    [self createTabBarController];
    
    
    
    
    
    return YES;
}



- (void)createTabBarController{

    self.tbc = [[UITabBarController alloc]init];
    
    [self createViewController];
    
    self.tbc.tabBar.tintColor = [UIColor redColor];
    self.window.rootViewController = _tbc;
    
}

- (void)createViewController{
    
    /** 新闻页面 */

    ViewController *item1 = [[ViewController alloc]init];
    UINavigationController *first = [[UINavigationController alloc]initWithRootViewController:item1];
    
    
     //item1.edgesForExtendedLayout = UIRectEdgeNone;

    /** 导航栏颜色 */
  //  first.navigationBar.barTintColor = [UIColor redColor];
    
    /** 右侧搜索,时间 bar 颜色 */
    first.navigationBar.tintColor = [UIColor whiteColor];

    
    
    
    
//    item1.navigationItem.title = @"网易新闻";
    
    
    //first.navigationItem.leftBarButtonItem.title = @"网易";
    
//    
//    //获取bar
//    UINavigationBar *bar = item1.navigationController.navigationBar;
//    //背景颜色
//    bar.barTintColor = [UIColor redColor];
//    
//    //文字颜色
//    bar.tintColor = [UIColor whiteColor];
//    //标题颜色
//    
//    
//    [bar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor],UITextAttributeTextShadowColor : [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],UITextAttributeFont : [UIFont fontWithName:@"AmericanTypewriter-Bold" size:25]
    
//}];
    
    

    first.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[UIImage imageNamed:@"xinwen"] tag:100];
    

    
   
    
    /** 阅读页面 */
    
    VCForItem2 *item2 =[[VCForItem2 alloc]init];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:item2];
    item2.navigationItem.title = @"网易阅读";
    second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"阅读" image:[UIImage imageNamed:@"yuedu"] tag:200];
    
    /** 试听页面 */
    
    VCForItem3 *item3 = [[VCForItem3 alloc] init];
    UINavigationController *third = [[UINavigationController alloc]initWithRootViewController:item3];
    item3.navigationItem.title = @"试听";
    third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"试听" image:[UIImage imageNamed:@"yuyinshiting"] tag:300];
    
    
    /** 话题页面 */
    
    VCForItem4 *item4 = [[VCForItem4 alloc] init];
    UINavigationController *fourth = [[UINavigationController alloc] initWithRootViewController:item4];
    
    item4.navigationItem.title = @"话题";
    fourth.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"话题" image:[UIImage imageNamed:@"huati"] tag:400];
    
    
    
    /** 我 页面 */
    
    VCForItem5 *item5 = [[VCForItem5 alloc] init];
    UINavigationController *fifth = [[UINavigationController alloc] initWithRootViewController:item5];
    item5.navigationItem.title = @"我";
    fifth.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"wo"] tag:500];
    
    
    

    self.tbc.viewControllers = @[first,second,third,fourth,fifth];
}











- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
