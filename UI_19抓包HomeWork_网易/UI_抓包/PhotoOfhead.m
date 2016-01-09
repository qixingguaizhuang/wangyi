//
//  PhotoOfhead.m
//  UI_抓包
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "PhotoOfhead.h"
#import "UIImageView+WebCache.h"
#import "ModelOfPag1.h"



@interface PhotoOfhead ()<UIScrollViewDelegate>

@property (nonatomic, retain)UIScrollView *scroll;
@property (nonatomic, retain)UIPageControl *page;
@property (nonatomic, retain)NSMutableArray *arrOfImages;
@property (nonatomic, retain)NSTimer *timer;

@end


@implementation PhotoOfhead




- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images{


    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width  , frame.size.height)];
    
    if (self) {
        self.arrOfImages = [NSMutableArray arrayWithArray:images];
        
        [self.arrOfImages addObject:self.arrOfImages.firstObject];
        [self.arrOfImages insertObject:[self.arrOfImages objectAtIndex:self.arrOfImages.count - 2] atIndex:0];
        
        [self createSrollWithFrame:frame];
        
    }

    return self;

}



- (void)createSrollWithFrame:(CGRect)frame{

    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height )];
    [self addSubview:self.scroll];
    
    //滚动范围
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrOfImages.count, frame.size.height);
    
    //翻页效果
    self.scroll.pagingEnabled = YES;
    // 偏移量
    self.scroll.contentOffset = CGPointMake(frame.size.width, 0);

    
    [self createImageViewWithFrame:frame];

    self.scroll.delegate = self;
    
}

/** scroll 上添加图片  轮播图 **/

- (void)createImageViewWithFrame:(CGRect)frame{

    for (int i = 0; i < self.arrOfImages.count; i++) {
       
        NSString *name = self.arrOfImages[i];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.arrOfImages[i]]  placeholderImage:[UIImage imageNamed:@"zhan"]];
         

        
        
        [self.scroll addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        
    }

}


/** 轮播 **/




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{


    if (scrollView.contentOffset.x == 0) {
        
        [self.scroll setContentOffset:CGPointMake(self.frame.size.width *(self.arrOfImages.count - 2), 0)];
        
    }

    if (scrollView.contentOffset.x == self.frame.size.width * (self.arrOfImages.count - 1)) {
        
        
        [self.scroll setContentOffset:CGPointMake(self.frame.size.width * (self.arrOfImages.count - 4), 0)];
    }


}



















@end
