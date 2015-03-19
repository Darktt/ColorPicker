//
//  DTColorPickerImageView.h
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DTColorPickerImageViewDelegate;

@interface DTColorPickerImageView : UIImageView

@property (weak) IBOutlet id<DTColorPickerImageViewDelegate> delegate;

@end

@protocol DTColorPickerImageViewDelegate <NSObject>

- (void)imageView:(DTColorPickerImageView *)imageView didPickColorWithColor:(UIColor *)color;

@end
