//
//  ILColorPicker.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILSaturationBrightnessPicker.h"
#import "ILHuePicker.h"

/**
 * Determines the layout of the color picker
 */
typedef enum {
    
    /// Hue picker is at bottom
    ILColorPickerLayoutBottom  =   0,
    
    // Hue picker is at right
    ILColorPickerLayoutRight   =   1,
    
} ILColorPickerLayout;

@class ILColorPicker;

/**
 * Delegate for the color picker
 */
@protocol ILColorPickerDelegate

/**
 * Called when the user has chosen a new color
 *
 * @param color The new color
 * @param picker The calling picker
 */
-(void)colorPicked:(UIColor *)color forPicker:(ILColorPicker *)picker;

@end

/**
 * Wraps an ILSaturationBrightnessPicker and ILHuePicker into a single
 * convenient control
 */
@interface ILColorPicker : ILView<ILSaturationBrightnessPickerDelegate> {
    id<ILColorPickerDelegate> delegate;
    
    ILSaturationBrightnessPicker *satPicker;
    ILHuePicker *huePicker;
    
    ILColorPickerLayout pickerLayout;
}

/**
 * Delegate
 */
@property (assign,nonatomic) IBOutlet id<ILColorPickerDelegate> delegate;

/**
 * The layout of the controls
 */
@property (assign,nonatomic) ILColorPickerLayout pickerLayout;

/**
 * Gets/sets the current color
 */
@property (assign,nonatomic) UIColor *color;

@end
