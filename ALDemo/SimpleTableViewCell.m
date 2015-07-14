//
//  SimpleTableViewCell.m
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "SimpleTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface SimpleTableViewCell ()
{
    // 1.头像
    UIImageView *_headImageView;
    // 2.昵称
    UILabel *_nameLabel;
    // 3.性别图标
    UIImageView *_sexImageView;
    // 4.车标
    UIImageView *_carImageView;
    // 5.时间
    UILabel *_timeLabel;
}

@end

@implementation SimpleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.translatesAutoresizingMaskIntoConstraints = NO;
//        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupSubViews];
        [self setBackgroundColor:[UIColor greenColor]];
        [self.contentView setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)setupSubViews
{
    // 1.头像
    _headImageView = [[UIImageView alloc] init];
    _headImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_headImageView];
    
    // 2.昵称
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = [UIFont systemFontOfSize:16.f];
//    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_nameLabel];
    
    // 3.性别图标
    _sexImageView = [[UIImageView alloc] init];
    _sexImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_sexImageView];
    
    // 4.车标
    _carImageView = [[UIImageView alloc] init];
    _carImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_carImageView];
    
    // 5.时间
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:11.f];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_timeLabel];
//    [self setNeedsUpdateConstraints];
}

- (void)setupContraints
{
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_headImageView, _nameLabel, _sexImageView, _carImageView, _timeLabel);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_headImageView(40)]-[_nameLabel]-[_sexImageView(15)]-[_carImageView(20)]" options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[_timeLabel]-|" options:0 metrics:nil views:viewsDict];
    [self.contentView addConstraints:constraints];
    
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_headImageView attribute:NSLayoutAttributeTop multiplier:1.f constant:0];
    [self.contentView addConstraint:contraint];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_headImageView(40)]" options:0 metrics:nil views:viewsDict];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_sexImageView(15)]" options:0 metrics:nil views:viewsDict];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_carImageView(20)]" options:0 metrics:nil views:viewsDict];
    [self.contentView addConstraints:constraints];
}

- (void)updateConstraints
{
    [super updateConstraints];
    [self setupContraints];
}

- (void)updateContentByEntity:(ALDemoEntity *)entity
{
    // 头像
    UIImage *image = [UIImage imageNamed:@"GOContactHeadDefault.png"];
//    if ([entity.fUserFaceThumbUrl length] > 0) {
//        [_headImageView sd_setImageWithURL:[NSURL URLWithString:entity.fUserFaceThumbUrl]
//                         placeholderImage:nil
//                                  options:0];
//    }
    [_headImageView setImage:image];
    
    // 车标
    if ([entity.carLogoUrlStr length] > 0) {
//        [_carImageView sd_setImageWithURL:[NSURL URLWithString:entity.carLogoUrlStr]
//                         placeholderImage:nil
//                                  options:0];
    }
    [_carImageView setImage:image];
    // 名字
    NSString *name = entity.userName;
    if (!name || name.length == 0) {
        name = @"null";
    }
    _nameLabel.text = name;

    // 性别图标
    int sexType = entity.sexType;
    _sexImageView.image = [UIImage imageNamed:@"golo_man.png"];
    if (sexType == 0) {
        _sexImageView.image = [UIImage imageNamed:@"golo_women.png"];
    }
    
    // 4.时间
    if (entity.createdTime && [entity.createdTime length] > 0) {
        _timeLabel.text = entity.createdTime;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
