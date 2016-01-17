//
//  ModelOfPag1.m
//  UI_抓包
//
//  Created by sp on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ModelOfPag1.h"

@implementation ModelOfPag1

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}



/** 归档时系统会自动调用此协议方法*/

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    /** 将需要保存的属性进行编码 根据需求**/
    [aCoder encodeObject:self.url forKey:@"url"];
    
    
}


/** 反归档时自动调用此协议方法 **/

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if (self) {
        self.url = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}



@end
