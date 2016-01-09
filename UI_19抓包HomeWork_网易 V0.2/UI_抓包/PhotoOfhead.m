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
@property (nonatomic, retain)UIImageView *imageView;


@property (nonatomic, retain)UILabel *label;

@property (nonatomic, retain)NSTimer *timer;

@end


@implementation PhotoOfhead



- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width  , frame.size.height)];
    
    if (self) {
        
        [self createSrollWithFrame:frame];
    }
    return self;

}


- (void)createSrollWithFrame:(CGRect)frame{

    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height )];
    self.scroll.contentOffset = CGPointMake(self.frame.size.width, 0);
    
    [self addSubview:self.scroll];
    //翻页效果
    self.scroll.pagingEnabled = YES;
    
    self.scroll.delegate = self;
}


/** scroll 上添加图片  轮播图 **/

- (void)createImageViewWithFrame:(CGRect)frame{
    
    //滚动范围
    self.scroll.contentSize = CGSizeMake(frame.size.width * self.arrOfImages.count, frame.size.height);
    
    for (int i = 0; i < self.arrOfImages.count; i++) {
        
        NSString *name = self.arrOfImages[i];
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
        
        self.imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.arrOfImages[i]]  placeholderImage:[UIImage imageNamed:@"zhan"]];
        
 
        [self.scroll addSubview:self.imageView];
        self.imageView.userInteractionEnabled = YES;
        
    }
    
}





/** 轮播 **/

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x == 0) {
        [self.scroll setContentOffset:CGPointMake(self.frame.size.width *(self.arrOfImages.count - 2), 0)];
    }

    if (scrollView.contentOffset.x == self.frame.size.width * (self.arrOfImages.count - 1)) {
        [self.scroll setContentOffset:CGPointMake(self.frame.size.width, 0)];
    }
}


/** 轮播图传值 */

- (void)passArrOfImages:(NSArray *)images {
    
    
    self.arrOfImages = [NSMutableArray arrayWithArray:images];
    [self.arrOfImages addObject:self.arrOfImages.firstObject];
    [self.arrOfImages insertObject:[self.arrOfImages objectAtIndex:self.arrOfImages.count - 2] atIndex:0];
    
    [self createImageViewWithFrame:self.frame];
    
    
}
















@end
