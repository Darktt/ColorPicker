//
//  ViewController.m
//  ColorPicker
//
//  Created by EdenLi on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "ViewController.h"
#import "DTColorPickerImageView.h"

@interface ViewController () <DTColorPickerImageViewDelegate>

@property (weak) IBOutlet UIView *colorPreviewView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imageView:(DTColorPickerImageView *)imageView didPickColorWithColor:(UIColor *)color
{
    [self.colorPreviewView setBackgroundColor:color];
    
    CGFloat red, green, blue;
    [color getRed:&red green:&green blue:&blue alpha:NULL];
    
    NSLog(@"Picked Color Components: %.0f, %.0f, %.0f", red * 255.0f, green * 255.0f, blue * 255.0f);
}

@end
