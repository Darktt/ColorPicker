//
//  DTColorPickerImageView.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DTColorPickerHandler)(UIColor *color);

@protocol DTColorPickerImageViewDelegate;

@interface DTColorPickerImageView : UIImageView

@property (assign) IBOutlet id<DTColorPickerImageViewDelegate> delegate;

+ (instancetype)colorPickerWithFrame:(CGRect)frame;
+ (instancetype)colorPickerWithImage:(UIImage *)image;

// When handler and delegate not nil, will handler respondes first.
- (void)handlesDidPickColor:(DTColorPickerHandler)handler;

@end

@protocol DTColorPickerImageViewDelegate <NSObject>

@optional
- (void)imageView:(DTColorPickerImageView *)imageView didPickColorWithColor:(UIColor *)color;

@end
