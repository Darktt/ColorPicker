//
//  UIImage+ColorPicker.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorPicker)

- (UIColor *)pickColorWithPoint:(CGPoint)point;
- (CGPoint)convertPoint:(CGPoint)viewPoint fromImageView:(UIImageView *)imageView;

@end
