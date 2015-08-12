//
//  NibTableViewCell.m
//  ALDemo
//
//  Created by bl on 15/8/12.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "NibTableViewCell.h"

@interface NibTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation NibTableViewCell

- (void)awakeFromNib {
    _subtitleLabel.preferredMaxLayoutWidth = self.bounds.size.width;
}

- (void)updateContentByTestEntity:(TestEntity *)testEntity
{
    [_titleLabel setText:testEntity.titleName];
    [_subtitleLabel setText:testEntity.subtitle];
}
@end
