//
//  ALDemoEntity.h
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALDemoEntity : NSObject

@property (nonatomic, assign) int sexType;          // 性别
@property (nonatomic, assign) long long created;
// 发布日期
@property (nonatomic, strong) NSString *createdTime;

@property (nonatomic, strong) NSString *userId;     //用户id
@property (nonatomic, strong) NSString *userName;   //用户名
@property (nonatomic, strong) NSString *fUserFaceUrl;
@property (nonatomic, strong) NSString *fUserFaceThumbUrl;
@property (nonatomic, strong) NSString *carLogoUrlStr;

+ (NSArray *)fakeEntities;

@end
