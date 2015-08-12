//
//  NibTableViewCell.h
//  ALDemo
//
//  Created by bl on 15/8/12.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestEntity.h"

@interface NibTableViewCell : UITableViewCell

- (void)updateContentByTestEntity:(TestEntity *)testEntity;

@end
