//
//  NibCellViewController.m
//  ALDemo
//
//  Created by bl on 15/8/12.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "NibCellViewController.h"
#import "NibTableViewCell.h"
#import "TestEntity.h"

@interface NibCellViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;

@end

@implementation NibCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupDataArr];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    NSDictionary *viewsDicts = NSDictionaryOfVariableBindings(_tableView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDicts];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[_tableView]|" options:0 metrics:nil views:viewsDicts];
    [self.view addConstraints:constraints];
}

// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat
{
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}

- (void)setupDataArr
{
    _dataArr = [NSMutableArray arrayWithCapacity:20];
    
    for (int i = 0; i < 20; i++) {
        TestEntity *entity = [[TestEntity alloc] init];
        entity.titleName = [self getText:@"titleName-" withRepeat:i * 2 + 1];
        entity.subtitle = [self getText:@"subtitle-" withRepeat:i * 3 + 1];
        [_dataArr addObject:entity];
    }
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NibTableViewCell *sCell;
    if (sCell == nil) {
        sCell = [[[NSBundle mainBundle] loadNibNamed:@"NibTableViewCell" owner:self options:nil]firstObject];
    }
    
    [sCell updateContentByTestEntity:_dataArr[indexPath.row]];
    
    CGFloat height = [self calculateHeightForConfiguredSizingCell:sCell];
    return height;
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell
{
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(sizingCell.bounds));
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NibTableViewCell *cell;
    cell = (NibTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NibTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NibTableViewCell" owner:self options:nil] firstObject];
    }
    [cell updateContentByTestEntity:_dataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
