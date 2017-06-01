//
//  PlaygroundVC.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "PlaygroundVC.h"
#import "UIArray.h"

@interface PlaygroundVC ()

@property (nonatomic, strong) UIScrollView * playgroundView;

@end

@implementation PlaygroundVC

- (void)loadView
{
    self.view = self.playgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIArray *arr = [[UIArray alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [self.view addSubview:arr];
    for (NSUInteger i = 0; i < 10; ++i)
    {
        [arr push:@(i)];
    }
    for (NSUInteger i = 0; i < 5; ++i)
    {
        [arr pop];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters and setters
- (UIScrollView *)playgroundView
{
    if (! _playgroundView)
    {
        _playgroundView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        [_playgroundView setContentSize:CGSizeMake(1000, 1000)];
        [_playgroundView setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8]];
        [_playgroundView setShowsHorizontalScrollIndicator:YES];
        [_playgroundView setShowsVerticalScrollIndicator:YES];
    }
    
    return _playgroundView;
}
@end
