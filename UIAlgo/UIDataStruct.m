//
//  UIDataStruct.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/4.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "UIDataStruct.h"

@implementation UIDataStruct

+ (UIScrollView *)playgroundView
{
    return (UIScrollView *)[[[[UIApplication sharedApplication] keyWindow] rootViewController] view];
}

+ (UIViewController *)playgroundViewController
{
    return [[[UIApplication sharedApplication] keyWindow] rootViewController];
}

@end
