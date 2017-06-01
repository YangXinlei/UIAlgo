//
//  UIArray.m
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import "UIArray.h"
#import "ElementView.h"

@interface UIArray ()

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSMutableArray<ElementView *> *elements;

@end

@implementation UIArray

- (void)push:(id)obj
{
    [self.array addObject:obj];
    
    ElementView *newElem = [[ElementView alloc] initWithFrame:CGRectMake(0, self.elements.count * 40, self.frame.size.width - 10, 40)];
    [newElem setShape:EVCircle];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height + 45);
    NSLog(@"🚩xxx---\n%@\n---xxx🦋", [obj description]);
    if (self.elements.count)
    {
        self.elements.lastObject.highlight = NO;
    }
    [newElem setHighlight:YES];
    [newElem setTitle:[obj description]];
    [self.elements addObject:newElem];
    [self addSubview:newElem];
    [self updateUI];
}

- (id)pop
{
    id obj = [self.array lastObject];
    [self.array removeLastObject];
    
    [self updateUI];
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

- (void)updateUI
{
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
