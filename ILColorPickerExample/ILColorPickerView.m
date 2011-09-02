//
//  ILColorPicker.m
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "ILColorPickerView.h"


@implementation ILColorPickerView

@synthesize delegate, pickerLayout, color;

#pragma mark - Setup

-(void)setup
{
    [super setup];
    
    self.opaque=NO;
    self.backgroundColor=[UIColor clearColor];
    
    huePicker=[[ILHuePickerView alloc] initWithFrame:CGRectZero];
    [self addSubview:huePicker];
    
    self.pickerLayout=ILColorPickerViewLayoutBottom;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Property Set/Get

-(void)setPickerLayout:(ILColorPickerViewLayout)layout
{
    pickerLayout=layout;

    if (satPicker!=nil)
    {
        [satPicker removeFromSuperview];   
        [satPicker release];
        satPicker=nil;
    }
    
    if (layout==ILColorPickerViewLayoutBottom)
    {
        huePicker.pickerOrientation=ILHuePickerViewOrientationHorizontal;
        [huePicker setFrame:CGRectMake(0, self.frame.size.height-38, self.frame.size.width, 38)];
        
        satPicker=[[ILSaturationBrightnessPickerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-10-38)];
        satPicker.delegate=self;
        huePicker.delegate=satPicker;
        [self addSubview:satPicker];
    }
    else
    {
        huePicker.pickerOrientation=ILHuePickerViewOrientationVertical;
        [huePicker setFrame:CGRectMake(self.frame.size.width-38, 0, 38, self.frame.size.height)];
        
        satPicker=[[ILSaturationBrightnessPickerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-10-38, self.frame.size.height)];
        satPicker.delegate=self;
        huePicker.delegate=satPicker;
        [self addSubview:satPicker];
    }
}

-(UIColor *)color
{
    return satPicker.color;
}

-(void)setColor:(UIColor *)c
{
    satPicker.color=c;
    huePicker.color=c;
}

#pragma mark - ILSaturationBrightnessPickerDelegate

-(void)colorPicked:(UIColor *)newColor forPicker:(ILSaturationBrightnessPickerView *)picker
{
    [delegate colorPicked:newColor forPicker:self];
}

@end
