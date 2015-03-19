//
//  DTColorPickerImageView.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DTColorPickerHandler)(UIColor *color);
@interface DTColorPickerImageView : UIImageView
+ (instancetype)colorPickerWithFrame:(CGRect)frame;
+ (instancetype)colorPickerWithImage:(UIImage *)image;
- (void)handlesDidPickColor:(DTColorPickerHandler)handler;
@end

