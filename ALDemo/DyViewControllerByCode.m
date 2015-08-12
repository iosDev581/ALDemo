//
//  DyViewControllerByCode.m
//  ALDemo
//
//  Created by bl on 15/8/12.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "DyViewControllerByCode.h"
#import "ALDemoEntity.h"
#import "DyTableViewCellByCode.h"

@interface DyViewControllerByCode ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *data;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation DyViewControllerByCode

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateData];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[DyTableViewCellByCode class] forCellReuseIdentifier:NSStringFromClass([DyTableViewCellByCode class])];
    
    [super updateViewConstraints];
    NSDictionary *viewsDicts = NSDictionaryOfVariableBindings(_tableView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDicts];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[_tableView]|" options:0 metrics:nil views:viewsDicts];
    [self.view addConstraints:constraints];
//    
    [_tableView reloadData];
}

// 生成数据
- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        ALDemoEntity *dataEntity = [ALDemoEntity new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _data = tmpData;
}

// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static DyTableViewCellByCode *templateCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DyTableViewCellByCode class])];
    });
    
    // 获取对应的数据
    ALDemoEntity *dataEntity = _data[(NSUInteger) indexPath.row];
    [templateCell setupData:dataEntity];
    
    CGFloat height = [self calculateHeightForConfiguredSizingCell:templateCell];
    return height;
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell
{
//    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(sizingCell.bounds));
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DyTableViewCellByCode *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DyTableViewCellByCode class]) forIndexPath:indexPath];
    [cell setupData:_data[(NSUInteger) indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

