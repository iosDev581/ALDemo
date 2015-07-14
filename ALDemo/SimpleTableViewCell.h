//
//  SimpleTableViewCell.h
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALDemoEntity.h"

@interface SimpleTableViewCell : UITableViewCell

- (void)updateContentByEntity:(ALDemoEntity *)entity;

@end
