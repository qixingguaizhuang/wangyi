//
//  NetWorkHandler.h
//  UI19_ 网络封装(delegate 回调)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol networkHandlerDelegate <NSObject>

- (void)handleDidComplete:(id)resule;

@end

@interface NetWorkHandler : NSObject

- (void)networkHandlerJSONWithURL:(NSString *)urlString;

+ (void)handlerJSONWithURL:(NSString *)urlString delegate:(id<networkHandlerDelegate>)delegate;


@property(nonatomic, assign)id<networkHandlerDelegate>delegate;

@end
