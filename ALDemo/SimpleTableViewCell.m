//
//  SimpleTableViewCell.m
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "SimpleTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "RWLabel.h"

@interface SimpleTableViewCell ()
{
//    // 1.头像
//    UIImageView *_headImageView;
//    // 2.昵称
//    UILabel *_nameLabel;
//    // 3.性别图标
//    UIImageView *_sexImageView;
//    // 4.车标
//    UIImageView *_carImageView;
//    // 5.时间
//    UILabel *_timeLabel;
    
    // 5.时间
    RWLabel *_titleLabel;
    RWLabel *_contentLabel;
}

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation SimpleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.translatesAutoresizingMaskIntoConstraints = NO;
//        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupSubViews];
//        [self setBackgroundColor:[UIColor greenColor]];
//        [self.contentView setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)setupSubViews
{
//    // 1.头像
//    _headImageView = [[UIImageView alloc] init];
//    _headImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_headImageView];
//    
//    // 2.昵称
//    _nameLabel = [[UILabel alloc] init];
//    _nameLabel.font = [UIFont systemFontOfSize:16.f];
////    _nameLabel.backgroundColor = [UIColor clearColor];
//    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_nameLabel];
//    
//    // 3.性别图标
//    _sexImageView = [[UIImageView alloc] init];
//    _sexImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_sexImageView];
//    
//    // 4.车标
//    _carImageView = [[UIImageView alloc] init];
//    _carImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_carImageView];
//    
//    // 5.时间
//    _timeLabel = [[UILabel alloc] init];
//    _timeLabel.font = [UIFont systemFontOfSize:11.f];
//    _timeLabel.textAlignment = NSTextAlignmentRight;
//    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_timeLabel];
    
    _titleLabel = [[RWLabel alloc] init];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [_titleLabel setNumberOfLines:1];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_titleLabel setTextColor:[UIColor blackColor]];
    _titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
//    _titleLabel.preferredMaxLayoutWidth = 200;
//    [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
//    [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    _contentLabel = [[RWLabel alloc] init];
    _contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_contentLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [_contentLabel setNumberOfLines:0];
    [_contentLabel setTextAlignment:NSTextAlignmentLeft];
    [_contentLabel setTextColor:[UIColor darkGrayColor]];
    _contentLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
//    _contentLabel.preferredMaxLayoutWidth = 280;
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_contentLabel];
}

- (void)updateConstraints
{
    [super updateConstraints];
    if (!_didSetupConstraints) {
        NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_titleLabel, _contentLabel);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_titleLabel]-10-|" options:0 metrics:nil views:viewsDict];
        [self.contentView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_contentLabel]-10-|" options:0 metrics:nil views:viewsDict];
        [self.contentView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_titleLabel]-10-[_contentLabel]-10-|" options:0 metrics:nil views:viewsDict];
        [self.contentView addConstraints:constraints];
        
        _didSetupConstraints = YES;
    }
    
}

- (void)updateContentByEntity:(ALDemoEntity *)entity
{
    [_titleLabel setText:@"titleLabeltitleLabeltitleLabeltitleLabeltitleLabelLabeltitleLtitleLabeltitleLabeltitleLabeltitleLabeltitleLabelLabeltitleLtitleLabeltitleLabeltitleLabeltitleLabeltitleLabelLabeltitleLabel........."];
    [_contentLabel setText:@"contentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabelcontentLabel"];
//    // 头像
//    UIImage *image = [UIImage imageNamed:@"GOContactHeadDefault.png"];
////    if ([entity.fUserFaceThumbUrl length] > 0) {
////        [_headImageView sd_setImageWithURL:[NSURL URLWithString:entity.fUserFaceThumbUrl]
////                         placeholderImage:nil
////                                  options:0];
////    }
//    [_headImageView setImage:image];
//    
//    // 车标
//    if ([entity.carLogoUrlStr length] > 0) {
////        [_carImageView sd_setImageWithURL:[NSURL URLWithString:entity.carLogoUrlStr]
////                         placeholderImage:nil
////                                  options:0];
//    }
//    [_carImageView setImage:image];
//    // 名字
//    NSString *name = entity.userName;
//    if (!name || name.length == 0) {
//        name = @"null";
//    }
//    _nameLabel.text = name;
//
//    // 性别图标
//    int sexType = entity.sexType;
//    _sexImageView.image = [UIImage imageNamed:@"golo_man.png"];
//    if (sexType == 0) {
//        _sexImageView.image = [UIImage imageNamed:@"golo_women.png"];
//    }
//    
//    // 4.时间
//    if (entity.createdTime && [entity.createdTime length] > 0) {
//        _timeLabel.text = entity.createdTime;
//    }
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
//    // need to use to set the preferredMaxLayoutWidth below.
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
//    
//    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
//    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
////    self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.frame);
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
