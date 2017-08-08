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
    [super didAddSubview:subview];
}

- (void)willRemoveSubview:(UIView *)subview
{
    if ([subview isKindOfClass:[UIDataStruct class]])
    {
         [subview removeObserver:self forKeyPath:@"frame"];
    }
    [super willRemoveSubview:subview];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"])
    {
        CGRect newFrame = ((NSValue *)change[@"new"]).CGRectValue;
        CGRect oldFrame = ((NSValue *)change[@"old"]).CGRectValue;
        
        // subview出离playgroundView时，调整playgroundView的大小
        if (! rect_is_equal(newFrame, oldFrame))
        {
            if (newFrame.origin.x + newFrame.size.width > self.contentSize.width)
            {
                // 调整大小
                [self setContentSize:CGSizeMake(newFrame.origin.x + newFrame.size.width, self.frame.size.height)];
            }
            
            if (newFrame.origin.y + newFrame.size.height > self.contentSize.height)
            {
                // 调整大小
                [self setContentSize:CGSizeMake(self.frame.size.width, newFrame.origin.y + newFrame.size.height)];
            }
            
            // 调整位置
            CGRect visibleRect = [self convertRect:[(UIDataStruct *)object highlightView].frame fromView:(UIDataStruct *)object];
            [self scrollRectToVisible:visibleRect animated:YES];
        }
    }
}

@end
