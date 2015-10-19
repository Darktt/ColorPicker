//
//  UIImage+ColorPicker.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (ColorPicker)

- (UIColor *)pickColorWithPoint:(CGPoint)point;
- (CGPoint)convertPoint:(CGPoint)viewPoint fromImageView:(__kindof UIImageView *)imageView;

@end
NS_ASSUME_NONNULL_END