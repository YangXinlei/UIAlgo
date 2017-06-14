//
//  ElementView.h
//  UIAlgo
//
//  Created by yangxinlei on 2017/5/26.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RADIUS                      20
#define WIDTH                       RADIUS * 2.0
#define HEIGHT                      WIDTH

#define CG_BORDER_COLOR                    [UIColor grayColor].CGColor
#define CG_HIGHLIGHT_BORDER_COLOR          [UIColor redColor].CGColor
#define COLOR                              [UIColor lightGrayColor]
#define HIGHLIGHT_COLOR                    [UIColor orangeColor]
#define CG_HIGHLIGHT_SHADOW_COLOR          [UIColor redColor].CGColor
#define HIGHLIGHT_SHADOW_RADIUS             3.0
#define HIGHLIGHT_SHADOW_OFFSET             CGSizeMake(0, 0)
#define HIGHLIGHT_SHADOW_OPACITY            0.8

#define BORDER_WIDTH                        2.0f

typedef enum : NSUInteger {
    EVRect,
    EVCircle,
} EVShape;

@interface ElementView : UIView

@property (nonatomic, copy) NSString    *title;
@property (nonatomic, copy) NSString    *info;
@property (nonatomic, assign) BOOL       highlight;
@property (nonatomic, assign) EVShape    shape;
@property (nonatomic, assign) BOOL       deleted;
@end
