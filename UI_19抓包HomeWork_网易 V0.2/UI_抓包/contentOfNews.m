//
//  contentOfNews.m
//  UI_抓包
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "contentOfNews.h"
#import "ModelOfPag1.h"
#import "UIImageView+WebCache.h"

@interface contentOfNews ()

@property (weak, nonatomic) IBOutlet UILabel *LableOftittle;
@property (weak, nonatomic) IBOutlet UILabel *LabelOfFollow;
@property (weak, nonatomic) IBOutlet UILabel *LabelOfCounts;
@property (weak, nonatomic) IBOutlet UIImageView *ImageOfleft;
@property (weak, nonatomic) IBOutlet UIImageView *ImageOfMid;
@property (weak, nonatomic) IBOutlet UIImageView *ImageOfRight;

@end

@implementation contentOfNews


- (void)passModel:(ModelOfPag1 *)model{

    self.LableOftittle.text = model.title;
    self.LabelOfCounts.text = model.replyCount.description;
    self.LabelOfFollow.text = @"跟帖";

    [self.ImageOfleft sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    [self.ImageOfMid sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];
    [self.ImageOfRight sd_setImageWithURL:[NSURL URLWithString:model.imgsrc] placeholderImage:[UIImage imageNamed:@"loading.jpg"]];

}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
