//
//  DTColorPickerImageView.m
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "DTColorPickerImageView.h"
#import "UIImage+ColorPicker.h"

@implementation DTColorPickerImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUserInteractionEnabled:YES];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    [self setUserInteractionEnabled:YES];
    
    return self;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    if (!CGRectContainsPoint(self.bounds, location)) {
        return;
    }
    
    CGPoint convertPoint = [self.image convertPoint:location fromImageView:self];
    
    UIColor *color = [self.image pickColorWithPoint:convertPoint];
    
    if ([self.delegate respondsToSelector:@selector(imageView:didPickColorWithColor:)]) {
        [self.delegate imageView:self didPickColorWithColor:color];
    }
}

@end
