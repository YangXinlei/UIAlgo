//
//  Utility.h
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/14.
//  Copyright © 2017年 qunar. All rights reserved.
//

#ifndef Utility_h
#define Utility_h

#import <UIKit/UIKit.h>

bool rect_is_equal(CGRect rect1, CGRect rect2)
{
    return  rect1.origin.x == rect2.origin.x &&
    rect1.origin.y == rect2.origin.y &&
    rect1.size.width == rect2.size.width &&
    rect1.size.height == rect2.size.height;
}


#endif /* Utility_h */
