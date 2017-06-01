//
//  UIArray.h
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIArray : UIView

- (void)push:(id)obj;

- (id)pop;

- (id)objectAtIndex:(NSUInteger)index;

- (NSUInteger)length;

@end
