//
//  ILHuePicker.h
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILView.h"

@class ILHuePicker;

/**
 * Hue picker delegate
 */
@protocol ILHuePickerDelegate

/**
 * Called when the user picks a new hue
 *
 * @param hue 0..1 The hue the user picked
 * @param picker The picker used
 */
-(void)huePicked:(float)hue picker:(ILHuePicker *)picker;

@end

/**
 * Displays a gradient allowing the user to select a hue
 */
@interface ILHuePicker : ILView {
    id<ILHuePickerDelegate> delegate;
    float hue;
}

/**
 * Delegate
 */
@property (assign, nonatomic) IBOutlet id<ILHuePickerDelegate> delegate;

/**
 * The current hue
 */
@property (assign, nonatomic) float hue;

/**
 * The current color
 */
@property (assign, nonatomic) UIColor *color;

@end
