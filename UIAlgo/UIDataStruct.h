//
//  UIDataStruct.h
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/4.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define thePlaygroundView           [UIDataStruct playgroundView]
#define thePlaygroundViewController [UIDataStruct playgroundViewController]

@interface UIDataStruct : UIView

+ (UIViewController *)playgroundViewController;

+ (UIScrollView *)playgroundView;

@end
