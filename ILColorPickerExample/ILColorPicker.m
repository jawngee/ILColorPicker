//
//  ILColorPicker.m
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "ILColorPicker.h"


@implementation ILColorPicker

@synthesize delegate, pickerLayout, color;

#pragma mark - Setup

-(void)setup
{
    [super setup];
    
    self.clipsToBounds=YES;
    self.opaque=NO;
    self.backgroundColor=[UIColor clearColor];
    
    huePicker=[[ILHuePicker alloc] initWithFrame:CGRectZero];
    [self addSubview:huePicker];
    
    self.pickerLayout=ILColorPickerLayoutBottom;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Property Set/Get

-(void)setPickerLayout:(ILColorPickerLayout)layout
{
    pickerLayout=layout;

    if (satPicker!=nil)
    {
        [satPicker removeFromSuperview];   
        [satPicker release];
        satPicker=nil;
    }
    
    if (layout==ILColorPickerLayoutBottom)
    {
        huePicker.pickerOrientation=ILHuePickerOrientationHorizontal;
        [huePicker setFrame:CGRectMake(0, self.frame.size.height-38, self.frame.size.width, 38)];
        
        satPicker=[[ILSaturationBrightnessPicker alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-10-38)];
        satPicker.delegate=self;
        huePicker.delegate=satPicker;
        [self addSubview:satPicker];
    }
    else
    {
        huePicker.pickerOrientation=ILHuePickerOrientationVertical;
        [huePicker setFrame:CGRectMake(self.frame.size.width-38, 0, 38, self.frame.size.height)];
        
        satPicker=[[ILSaturationBrightnessPicker alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-10-38, self.frame.size.height)];
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

-(void)colorPicked:(UIColor *)newColor forPicker:(ILSaturationBrightnessPicker *)picker
{
    [delegate colorPicked:newColor forPicker:self];
}

@end
