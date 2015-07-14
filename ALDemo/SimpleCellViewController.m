//
//  SimpleCellViewController.m
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "SimpleCellViewController.h"
#import "SimpleTableViewCell.h"

@interface SimpleCellViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;

@end

@implementation SimpleCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor yellowColor]];
    [self setupData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.backgroundView = nil;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

//- (void)updateViewConstraints
//{
//    [super updateViewConstraints];
//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_tableView);
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDict];
//    [self.view addConstraints:constraints];
//    
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:viewsDict];
//    [self.view addConstraints:constraints];
//}

- (void)setupData
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:20];
    }
    _dataArr = [NSMutableArray arrayWithArray:[ALDemoEntity fakeEntities]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static SimpleTableViewCell *sCell;
    if (sCell == nil) {
        sCell = [[SimpleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableViewCell"];
    }
    [sCell updateContentByEntity:[_dataArr objectAtIndex:indexPath.row]];
//    [sCell setNeedsUpdateConstraints];
////    [sCell layoutIfNeeded];
    
    CGFloat height = ([sCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f);
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static SimpleTableViewCell *cell;
    cell = (SimpleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewCell"];
    if (cell == nil) {
        cell = [[SimpleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableViewCell"];
    }
    [cell updateContentByEntity:[_dataArr objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
