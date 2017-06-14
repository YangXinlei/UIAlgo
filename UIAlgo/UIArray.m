//
//  UIArray.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "UIArray.h"
#import "ElementView.h"
#import "PlaygroundVC.h"

typedef void(^UIUpdateBlock)();

@interface UIArray ()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray<ElementView *> *elements;
@property (nonatomic, strong) NSMutableArray<UIUpdateBlock> *blocks;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation UIArray

- (instancetype)initWithFrame:(CGRect)frame
{
    CGRect playgroundFrame = thePlaygroundView.frame;
    frame = CGRectMake(CGRectGetMidX(playgroundFrame), CGRectGetMidY(playgroundFrame), 0, 0);
    if (self = [super initWithFrame:frame])
    {
        [thePlaygroundView addSubview:self];
        _blocks = [NSMutableArray new];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runABlock) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)push:(id)obj
{
    [self.array addObject:obj];
    
    [self updateUIIfNeed];
    
    __weak typeof(self) weakSelf = self;
    [_blocks insertObject:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        ElementView *newElem = [[ElementView alloc] initWithFrame:CGRectMake(0, strongSelf.frame.size.height, 0, 0)];
        if (strongSelf.elements.count)
        {
            strongSelf.elements.lastObject.highlight = NO;
        }
        [newElem setHighlight:YES];
        [newElem setTitle:[obj description]];
        [strongSelf.elements addObject:newElem];
        [strongSelf addSubview:newElem];
        strongSelf.frame = CGRectMake(strongSelf.frame.origin.x, strongSelf.frame.origin.y, MAX(strongSelf.frame.size.width, newElem.frame.size.width), strongSelf.frame.size.height + newElem.frame.size.height);
        
        [strongSelf updateUI];
    } atIndex:0];
}

- (id)pop
{
    [self setFrame:CGRectMake(100, 100, 100, 100)];
    id obj = [self.array lastObject];
    [self.array removeLastObject];
    
    __weak typeof(self) weakSelf = self;
    [_blocks insertObject:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.elements.count)
        {
//            [strongSelf.elements.lastObject setDeleted:YES];
            [strongSelf.elements removeLastObject];
        }
        
        [self updateUI];
    } atIndex:0];
    
    return obj;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self.array objectAtIndex:index];
}

- (NSUInteger)length
{
    return [self.array count];
}

- (void )runABlock
{
    if (self.blocks.count > 0)
    {
        UIUpdateBlock aBlock = self.blocks.lastObject;
        aBlock();
        [self.blocks removeLastObject];
    }
}

- (void)updateUIIfNeed
{
    
}

- (void)updateUI
{
    CGFloat height = thePlaygroundView.contentSize.height, width = thePlaygroundView.contentSize.width;
    if (self.frame.origin.y + self.frame.size.height >= height)
    {
        height *= 2;
    }
    if (self.frame.origin.x + self.frame.size.width >= width)
    {
        width *= 2;
    }
    
    [thePlaygroundView setContentSize:CGSizeMake(width, height)];
    [thePlaygroundView scrollRectToVisible:self.frame animated:YES];
    
    [self setNeedsDisplay];
}

- (NSMutableArray *)array
{
    if (! _array)
    {
        _array = [NSMutableArray new];
    }
    return _array;
}

- (NSMutableArray *)elements
{
    if (! _elements)
    {
        _elements = [NSMutableArray new];
    }
    return _elements;
}
@end
