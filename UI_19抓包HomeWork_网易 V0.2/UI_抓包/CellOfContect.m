//
//  CellOfContect.m
//  UI_抓包
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfContect.h"
#import "ModelOfPag1.h"
#import "UIImageView+WebCache.h"



@interface CellOfContect ()

@property (nonatomic, retain)UIImageView *imageOfleft;
@property (nonatomic, retain)UILabel *topLabel;
@property (nonatomic, retain)UILabel *bottomLabel;
@property (nonatomic, retain)UILabel *CountOfLabel;
@property (nonatomic, retain)UILabel *followOfCount;

@end

@implementation CellOfContect



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   
    if (self) {
        [self  createCellOfcontect];
    }
    
    return self;
}



- (void)createCellOfcontect{

      self.imageOfleft = [[UIImageView alloc]init];
         self.topLabel = [[UILabel alloc] init];
      self.bottomLabel = [[UILabel alloc] init];
     self.CountOfLabel = [[UILabel alloc] init];
    self.followOfCount = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.imageOfleft];
    [self.contentView addSubview:self.topLabel];
    [self.contentView addSubview:self.bottomLabel];
    [self.contentView addSubview:self.CountOfLabel];
    [self.contentView addSubview:self.followOfCount];


}


- (void)layoutSubviews{

    [super layoutSubviews];
    
//     CGFloat width = self.contentView.frame.size.width;
//    CGFloat height = self.contentView.frame.size.height;
    
    self.imageOfleft.frame = CGRectMake(10, 18, 100, 80);
    self.topLabel.frame = CGRectMake(120, 10, 400, 30);
    self.bottomLabel.frame = CGRectMake(120, 50, 286, 50);
    self.CountOfLabel.frame = CGRectMake(290, 75, 60, 30);
    self.followOfCount.frame = CGRectMake(355, 75, 60, 30);
    
    self.bottomLabel.numberOfLines = 0;
}




- (void)passModel:(ModelOfPag1 *)model{

    self.topLabel.text = model.title;
    self.bottomLabel.text =model.digest;
    self.CountOfLabel.text = model.replyCount.description;
 
    [self.imageOfleft sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    self.followOfCount.text = @"跟帖";
    self.CountOfLabel.textAlignment = NSTextAlignmentRight;

}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
