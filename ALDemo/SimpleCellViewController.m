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

//@property (strong, nonatomic) UITextField *textFiled;

@end

@implementation SimpleCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupData];
//    
//    _textFiled = [[UITextField alloc] initWithFrame:CGRectZero];
//    _textFiled.translatesAutoresizingMaskIntoConstraints = NO;
//    _textFiled.placeholder  = NSLocalizedString(@"GOInputCarBrandNum", nil);
//    _textFiled.backgroundColor = [UIColor grayColor];
//    //    suffixTextField.returnKeyType = UIReturnKeyDone;
//    //    _textFiled.delegate = self;
//    _textFiled.font = [UIFont systemFontOfSize:16.f];
//    _textFiled.textColor = [UIColor blackColor];
//    //    [suffixTextField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
//    //    [headerPlateView addSubview:suffixTextField];
//    [self.view addSubview:_textFiled];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.backgroundView = nil;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_tableView);
    
    // 水平方向
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDict];
    [self.view addConstraints:constraints];
    
    // 垂直方向
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:viewsDict];
    [self.view addConstraints:constraints];
    
//    [self.view setNeedsUpdateConstraints];
}

//- (void)updateViewConstraints
//{
//    [super updateViewConstraints];
//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_tableView);
//    
//    // 水平方向
//    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDict];
//    [self.view addConstraints:constraints];
//
//    // 垂直方向
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:viewsDict];
//    [self.view addConstraints:constraints];
//}

- (void)setupData
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:3];
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
    
    CGFloat height = [self calculateHeightForConfiguredSizingCell:sCell];
    return height;
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell{
    
    [sizingCell setNeedsUpdateConstraints];
    [sizingCell updateConstraintsIfNeeded];
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(_tableView.bounds), CGRectGetHeight(sizingCell.bounds));
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
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
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
