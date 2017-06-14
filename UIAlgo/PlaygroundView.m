//
//  PlaygroundView.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/14.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "PlaygroundView.h"
#import "UIDataStruct.h"
#import "Utility.h"

@implementation PlaygroundView

- (void)didAddSubview:(UIView *)subview
{
    if ([subview isKindOfClass:[UIDataStruct class]])
    {
        [subview addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}

- (void)willRemoveSubview:(UIView *)subview
{
    if ([subview isKindOfClass:[UIDataStruct class]])
    {
         [subview removeObserver:self forKeyPath:@"frame"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"])
    {
        CGRect newFrame = ((NSValue *)change[@"new"]).CGRectValue;
        CGRect oldFrame = ((NSValue *)change[@"old"]).CGRectValue;
        if (! rect_is_equal(newFrame, oldFrame))
        {
            
        }
    }
}

@end
