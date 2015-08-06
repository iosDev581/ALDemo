//
//  ViewController.m
//  ALDemo
//
//  Created by bl on 15/7/14.
//  Copyright (c) 2015年 bl. All rights reserved.
//

#import "ViewController.h"
#import "SimpleCellViewController.h"

@interface ViewController ()
{
    UIButton *_staticModeBtn;
    UIButton *_dynamicModeBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"Home"];
    
    _staticModeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _staticModeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_staticModeBtn setTitle:@"StaticModeBtn" forState:UIControlStateNormal];
    [_staticModeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_staticModeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:_staticModeBtn];
    [_staticModeBtn addTarget:self action:@selector(staticModeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _dynamicModeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _dynamicModeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_dynamicModeBtn setTitle:@"DynamicModeBtn" forState:UIControlStateNormal];
    [_dynamicModeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dynamicModeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:_dynamicModeBtn];
    [_dynamicModeBtn addTarget:self action:@selector(dynamicModeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view setNeedsUpdateConstraints];
}


- (void)updateViewConstraints
{
    [super updateViewConstraints];
    // 水平方向
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:_staticModeBtn
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.f constant:-10];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dynamicModeBtn
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.f constant:10];
    [self.view addConstraint:constraint];

    // y方向
    constraint = [NSLayoutConstraint constraintWithItem:_dynamicModeBtn
                                              attribute:NSLayoutAttributeCenterY
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterY
                                             multiplier:1.f constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dynamicModeBtn
                                              attribute:NSLayoutAttributeCenterY
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_staticModeBtn
                                              attribute:NSLayoutAttributeCenterY
                                             multiplier:1.f constant:0];
    [self.view addConstraint:constraint];
    
    // 宽高
    constraint = [NSLayoutConstraint constraintWithItem:_dynamicModeBtn
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_staticModeBtn
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1.f constant:0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_dynamicModeBtn
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:_staticModeBtn
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1.f constant:0];
    [self.view addConstraint:constraint];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#pragma mark - 按钮点击

- (void)staticModeBtnClick
{
    SimpleCellViewController *simpleVc = [[SimpleCellViewController alloc] init];
    [self.navigationController pushViewController:simpleVc animated:YES];
}

- (void)dynamicModeBtnClick
{
    
}

@end
