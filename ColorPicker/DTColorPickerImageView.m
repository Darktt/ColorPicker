//
//  DTColorPickerImageView.m
//  ColorPicker
//
//  Created by Darktt on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "DTColorPickerImageView.h"
#import "UIImage+ColorPicker.h"
@interface DTColorPickerImageView()
@property (copy) DTColorPickerHandler handler;
@end

@implementation DTColorPickerImageView

+ (instancetype)colorPickerWithFrame:(CGRect)frame
{
    DTColorPickerImageView *colorPicker = [[DTColorPickerImageView alloc] initWithFrame:frame];
    
    return [colorPicker autorelease];
}

+ (instancetype)colorPickerWithImage:(UIImage *)image
{
    DTColorPickerImageView *colorPicker = [[DTColorPickerImageView alloc] initWithImage:image];
    
    return [colorPicker autorelease];
}

-(void) handlesDidPickColor:(DTColorPickerHandler)handler {
    self.handler = handler;
}

#pragma mark - Instance Methods

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

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self == nil) return nil;
    
    [self setUserInteractionEnabled:YES];
    
    return self;
}

#pragma mark - Touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    [self pickerColorAtPoint:location];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    if (!CGRectContainsPoint(self.bounds, location)) {
        return;
    }
    
    [self pickerColorAtPoint:location];
}

- (void)pickerColorAtPoint:(CGPoint)point
{
    CGPoint convertPoint = [self.image convertPoint:point fromImageView:self];
    UIColor *color = [self.image pickColorWithPoint:convertPoint];
    self.handler(color);
}

@end
