//
//  ViewController.m
//  ColorPicker
//
//  Created by EdenLi on 2015/3/19.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "ViewController.h"
#import "DTColorPickerImageView.h"

@interface ViewController ()
@property (weak) IBOutlet UIView *colorPreviewView;
@property (weak, nonatomic) IBOutlet DTColorPickerImageView *pickerImgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.pickerImgView handlesDidPickColor:^(UIColor *color) {
        [self.colorPreviewView setBackgroundColor:color];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
