//
//  NetWorkHandler.m
//  UI19_ 网络封装(delegate 回调)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NetWorkHandler.h"
//#import "UIImageView+WebCache.h"

@implementation NetWorkHandler

/** 通过 NSURLSession 实现网络请求*/

- (void)networkHandlerJSONWithURL:(NSString *)urlString{

    
    // 将字符串进行转码 ( URL 中不能含有中文等字符) URLQueryAllowedCharacterSet 查询时转换
    NSString *temp = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
   // NSLog(@"%@", temp);
    
    // URL
    NSURL *url = [NSURL URLWithString:temp];
    
    // 创建通道 session
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        /** 返回主线程 */
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *errorOfJSON = nil;
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers  error:&errorOfJSON];
            
            if ([self.delegate respondsToSelector:@selector(handleDidComplete:)]) {
                
                [self.delegate handleDidComplete:result];
            }
        });
        
        
    }];


    [task resume];

}




+ (void)handlerJSONWithURL:(NSString *)urlString delegate:(id<networkHandlerDelegate>)delegate{


    NetWorkHandler *handler = [[NetWorkHandler alloc]init];
    
    handler.delegate = delegate;
    
    [handler networkHandlerJSONWithURL:urlString];
    


}










@end
