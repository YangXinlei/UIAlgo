//
//  UIDataStruct.h
//  UIAlgo
//
//  Created by yangxinlei on 2017/6/4.
//  Copyright © 2017年 qunar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ElementView;
/**
 包裹其中的所有元素视图、指针视图等，其形状应当是恰好包含其所有子view的rect。
     之所以这样做，是为了其父view(playgroundView)可以根据本view的frame随时调整大小和展示区域
 */
@interface UIDataStruct : UIView


/**
 playgroundView会在适当时机确保该view可见
 */
@property (nonatomic, strong) ElementView *highlightView;

@end
