//
//  ALDemoEntity.m
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "ALDemoEntity.h"

@implementation ALDemoEntity

+ (NSArray *)fakeEntities
{
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i++) {
        [tempArr addObject:[ALDemoEntity fakeEntity]];
    }
    return [NSArray arrayWithArray:tempArr];
}

+ (ALDemoEntity *)fakeEntity
{
    // 1436843161
    ALDemoEntity *entity = [[ALDemoEntity alloc] init];
    entity.userName = @"test";
    entity.fUserFaceThumbUrl = @"http://golo.test.x431.com:8008/res/group/29/43/01/103492.thumb?118";
    entity.sexType = 1;
    entity.carLogoUrlStr = @"http://golo.test.x431.com:8008/res/auto_logos/8.png";
    entity.createdTime =  [ALDemoEntity timeStrByDate:[NSDate date] format:@"yyyy-MM-dd"];
    return entity;
}

+ (NSString *)timeStrByDate:(NSDate *)date format:(NSString *)format
{
    static NSDateFormatter * outputFormatter;
    
    if(outputFormatter == nil)
    {
        outputFormatter = [[NSDateFormatter alloc] init];
    }
    [outputFormatter setDateFormat:format];
    
    NSString *timestamp_str = [outputFormatter stringFromDate:date];
    return timestamp_str;
}

@end
