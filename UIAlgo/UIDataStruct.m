//
//  UIDataStruct.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/4.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "UIDataStruct.h"
#import "ElementView.h"

@implementation UIDataStruct

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.layer.borderWidth = 5.0;
        self.layer.borderColor = [UIColor greenColor].CGColor;
    }
    return self;
}

- (UIView *)highlightView
{
    return [self.subviews lastObject];
}

- (void)didAddSubview:(ElementView *)subview
{
    if (self.highlightView)
    {
        [self.highlightView setHighlight:NO];
    }
    self.highlightView = subview;
    [subview setHighlight:YES];
    
    // 调整大小
    if (self.frame.size.width < subview.frame.origin.x + subview.frame.size.width)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, subview.frame.origin.x + subview.frame.size.width, self.frame.size.height);
    }
    
    if (self.frame.size.height < subview.frame.origin.y + subview.frame.size.height)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, subview.frame.origin.y + subview.frame.size.height);
    }
}

- (void)willRemoveSubview:(UIView *)subview
{
    if (subview == self.highlightView)
    {
        [subview setHidden:NO];
    }
    self.highlightView = [self previousViewOfView:subview];
    
    // 调整大小
    if (subview.frame.origin.x + subview.frame.size.width < self.frame.size.width && subview.frame.origin.y + subview.frame.size.height < self.frame.size.height)
    {
        // 无需调整
        return ;
    }
    
    // 找到子view的右下角边界
    CGFloat maxX = 0.0, maxY = 0.0;
    for (UIView *sub in self.subviews)
    {
        // 不包含待删除的view
        if (sub == subview) { continue ; }
        
        if (sub.frame.origin.x + sub.frame.size.width > maxX)
        {
            maxX = sub.frame.origin.x + sub.frame.size.width;
        }
        
        if (sub.frame.origin.y + sub.frame.size.height > maxY)
        {
            maxY = sub.frame.origin.y + sub.frame.size.height;
        }
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, maxX, maxY);
}

- (UIView *)previousViewOfView:(UIView *)view
{
    
}

@end
