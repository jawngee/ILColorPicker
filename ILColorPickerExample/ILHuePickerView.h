//
//  ILHuePicker.h
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILView.h"

/**
 * Controls the orientation of the picker
 */
typedef enum {
    ILHuePickerViewOrientationHorizontal     =   0,
    ILHuePickerViewOrientationVertical       =   1
} ILHuePickerViewOrientation;

@class ILHuePickerView;

/**
 * Hue picker delegate
 */
@protocol ILHuePickerViewDelegate

/**
 * Called when the user picks a new hue
 *
 * @param hue 0..1 The hue the user picked
 * @param picker The picker used
 */
-(void)huePicked:(float)hue picker:(ILHuePickerView *)picker;

@end

/**
 * Displays a gradient allowing the user to select a hue
 */
@interface ILHuePickerView : ILView {
    id<ILHuePickerViewDelegate> delegate;
    float hue;
    ILHuePickerViewOrientation pickerOrientation;
}

/**
 * Delegate
 */
@property (assign, nonatomic) IBOutlet id<ILHuePickerViewDelegate> delegate;

/**
 * The current hue
 */
@property (assign, nonatomic) float hue;

/**
 * The current color
 */
@property (assign, nonatomic) UIColor *color;

/**
 * Orientation
 */
@property (assign, nonatomic) ILHuePickerViewOrientation pickerOrientation;


@end
