//
//  PlaygroundVC.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "PlaygroundVC.h"
#import "Playground.h"

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
    
    [[Playground mainPlayground] play];
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
        [_playgroundView setBackgroundColor:[UIColor whiteColor]];
        [_playgroundView setShowsHorizontalScrollIndicator:YES];
        [_playgroundView setShowsVerticalScrollIndicator:YES];
        [_playgroundView setContentSize:[UIScreen mainScreen].bounds.size];
    }
    
    return _playgroundView;
}
@end
