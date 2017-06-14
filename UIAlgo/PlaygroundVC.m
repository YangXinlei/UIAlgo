//
//  PlaygroundVC.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "PlaygroundVC.h"
#import "PlaygroundVC+play.h"
#import "PlaygroundView.h"

@interface PlaygroundVC ()

@property (nonatomic, strong) PlaygroundView * playgroundView;

@end

@implementation PlaygroundVC

+ (instancetype)mainPlaygroundVC
{
    static dispatch_once_t onceToken;
    static PlaygroundVC *mainVC;
    dispatch_once(&onceToken, ^{
        mainVC = [PlaygroundVC new];
    });
    return mainVC;
}

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
    
    [self play];
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
        _playgroundView = [[PlaygroundView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_playgroundView setBackgroundColor:[UIColor whiteColor]];
        [_playgroundView setShowsHorizontalScrollIndicator:YES];
        [_playgroundView setShowsVerticalScrollIndicator:YES];
        [_playgroundView setContentSize:[UIScreen mainScreen].bounds.size];
    }
    
    return _playgroundView;
}
@end
