//
//  ElementView.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "ElementView.h"

@interface ElementView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ElementView
@dynamic title;

- (instancetype)initWithFrame:(CGRect)frame
{
    CGRect realFrame = CGRectMake(frame.origin.x, frame.origin.y, WIDTH, HEIGHT);
    if (self = [super initWithFrame:realFrame])
    {
        // use oc default behaviour
//        _highlight = NO;
//        _shape = EVRect;
        
        self.layer.borderColor = CG_BORDER_COLOR;
        self.layer.borderWidth = BORDER_WIDTH;
        self.backgroundColor = COLOR;
        
        [self addSubview:self.titleLabel];
    }
    return self;
}


#pragma mark - getters and setters
- (UILabel *)titleLabel
{
    if ( ! _titleLabel)
    {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (NSString *)title
{
    return self.titleLabel.text;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    
    // 居中
    CGFloat midX = CGRectGetMidX(self.frame);
    CGFloat midY = CGRectGetMidY(self.frame);
    CGPoint center = CGPointMake(midX - self.frame.origin.x, midY - self.frame.origin.y);
    self.titleLabel.center = center;
}

- (void)setHighlight:(BOOL)highlight
{
    self.layer.borderColor = highlight ? CG_HIGHLIGHT_BORDER_COLOR : CG_BORDER_COLOR;
    self.layer.shadowColor = highlight ?  CG_HIGHLIGHT_BORDER_COLOR : [UIColor clearColor].CGColor;
    self.layer.shadowOffset = HIGHLIGHT_SHADOW_OFFSET;
    self.layer.shadowRadius = HIGHLIGHT_SHADOW_RADIUS;
    self.layer.shadowOpacity = HIGHLIGHT_SHADOW_OPACITY;
    self.backgroundColor = highlight ? HIGHLIGHT_COLOR : COLOR;
}

- (void)setShape:(EVShape)shape
{
    switch (shape) {
        case EVCircle:
            self.layer.cornerRadius = RADIUS;
            break;
        case EVRect:
            self.layer.cornerRadius = 0.0;
        default:
            break;
    }
}

@end
