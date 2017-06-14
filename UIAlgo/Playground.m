//
//  Playground.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/1.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "Playground.h"

// UI 数据结构
#import "UIArray.h"


@implementation Playground

+ (instancetype)mainPlayground
{
    static dispatch_once_t onceToken;
    static Playground *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [Playground new];
    });
    return _instance;
}

- (void)play
{
    UIArray *arr = [[UIArray alloc] init];
    for (NSUInteger i = 0; i < 4; ++i)
    {
        [arr push:@(i)];
    }
    for (NSUInteger i = 0; i < 2; ++i)
    {
        [arr pop];
    }
    
}

@end
