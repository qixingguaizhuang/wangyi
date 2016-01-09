//
//  CellOfImage.m
//  UI_抓包
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfImage.h"

@interface CellOfImage ()<UIScrollViewDelegate>


@property (nonatomic, retain)UIScrollView *scroll;
@property (nonatomic, retain)UIPageControl *page;
@property (nonatomic, retain)NSMutableArray *arrOfImages;
@property (nonatomic, retain)NSTimer *timer;

@end


@implementation CellOfImage


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
    }

    return self;

}



- (void)createCellOfImage{







}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
