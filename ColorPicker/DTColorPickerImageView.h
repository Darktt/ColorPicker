//
//  DTColorPickerImageView.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DTColorPickerHandler)(UIColor *__nonnull color);

@protocol DTColorPickerImageViewDelegate;

NS_ASSUME_NONNULL_BEGIN
@interface DTColorPickerImageView : UIImageView

@property (assign, nullable) IBOutlet id<DTColorPickerImageViewDelegate> delegate;

+ (instancetype)colorPickerWithFrame:(CGRect)frame;
+ (instancetype)colorPickerWithImage:(nullable UIImage *)image;

// When handler and delegate not nil, will handler respondes first.
- (void)handlesDidPickColor:(DTColorPickerHandler)handler;

@end

@protocol DTColorPickerImageViewDelegate <NSObject>

@optional
- (void)imageView:(DTColorPickerImageView *)imageView didPickColorWithColor:(UIColor *)color;

@end
NS_ASSUME_NONNULL_END