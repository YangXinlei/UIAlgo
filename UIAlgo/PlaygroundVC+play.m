//
//  PlaygroundVC+play.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/14.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "PlaygroundVC+play.h"

// UI 数据结构
#import "UIArray.h"

@implementation PlaygroundVC (play)


/**
 write algorithms here.
 */
- (void)play
{
    UIArray *arr = [[UIArray alloc] init];
    for (NSUInteger i = 0; i < 10; ++i)
    {
        [arr push:@(i)];
    }
    for (NSUInteger i = 0; i < 10; ++i)
    {
        [arr pop];
    }
}

@end
