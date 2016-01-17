//
//  cellForImage.m
//  NetEase
//
//  Created by dllo on 16/1/17.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "cellForImage.h"
#import "modelForNETEASE.h"
#import "UIImageView+WebCache.h"

@interface cellForImage ()
@property (nonatomic, retain) UIImageView *imageForHead;
@property (nonatomic, retain) UILabel *tittleForImage;
@property (nonatomic, retain) NSMutableArray *arrForImages;

@end

@implementation cellForImage


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        
        [self createCellForImages];
        
    }

    return self;
}


- (void)createCellForImages{

    self.imageForHead = [[UIImageView alloc]init];
    self.tittleForImage = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.imageForHead];
    [self.contentView addSubview:self.tittleForImage];

}

- (void)layoutSubviews{

    [super layoutSubviews];
    self.imageForHead.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 200);
    self.tittleForImage.frame = CGRectMake(0, 150, 200, 30);

}



- (void)pastModelForHeadImages:(modelForNETEASE *) model{

    [self.imageForHead sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.tittleForImage.text = model.title;
}















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
