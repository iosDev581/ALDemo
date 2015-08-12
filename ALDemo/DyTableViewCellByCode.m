//
//  DyTableViewCellByCode.m
//  ALDemo
//
//  Created by bl on 15/8/12.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "DyTableViewCellByCode.h"

@interface DyTableViewCellByCode ()

@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *contentLabel;
@property(nonatomic, strong) ALDemoEntity *dataEntity;
@end

@implementation DyTableViewCellByCode

// 调用UITableView的dequeueReusableCellWithIdentifier方法时会通过这个方法初始化Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setupData:(ALDemoEntity *)dataEntity
{
    _dataEntity = dataEntity;
    _avatarImageView.image = dataEntity.avatar;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

#pragma mark - Private methods

- (void)initView
{
    // Avatar头像
//    _avatarImageView = [[UIImageView alloc] init];
//    _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview:_avatarImageView];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_titleLabel];
    
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 40 - 8 - 10;
    
    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    _contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_contentLabel];
    
    NSLayoutConstraint *constraint = nil;
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.f constant:4];
//    [self addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.f constant:4];
//    [self addConstraint:constraint];
//
//    constraint = [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:40];
//    [self addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:40];
//    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.f constant:48];
    [self addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.f constant:4];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.f constant:-4];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:22];
    [self addConstraint:constraint];
    
    
    constraint = [NSLayoutConstraint constraintWithItem:_contentLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_titleLabel attribute:NSLayoutAttributeLeft multiplier:1.f constant:0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_contentLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_titleLabel attribute:NSLayoutAttributeBottom multiplier:1.f constant:4];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_contentLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.f constant:-4];
    [self addConstraint:constraint];
    
    
//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_avatarImageView, _titleLabel, _contentLabel);
//    // 设置约束
//    // 水平方向
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[_avatarImageView(==40)]-4-[_titleLabel]-10-|" options:0 metrics:nil views:viewsDict];
//    [self addConstraints:constraints];
//    
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_avatarImageView]-4-[_contentLabel]-10-|" options:0 metrics:nil views:viewsDict];
//    [self addConstraints:constraints];
//    
//    // 垂直方向
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[_avatarImageView(==40)]" options:0 metrics:nil views:viewsDict];
//    [self addConstraints:constraints];
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[_titleLabel(22)]-4-[_contentLabel]-10-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDict];
//    [self addConstraints:constraints];
    
//    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.and.height.equalTo(@44);
//        make.left.and.top.equalTo(self.contentView).with.offset(4);
//    }];
    
    // Title - 单行

    
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@22);
//        make.top.equalTo(self.contentView).with.offset(4);
//        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
//        make.right.equalTo(self.contentView).with.offset(-4);
//    }];
    

    
//    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
//        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
//        make.right.equalTo(self.contentView).with.offset(-4);
//        make.bottom.equalTo(self.contentView).with.offset(-4);
//    }];
//    
    //    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

@end
