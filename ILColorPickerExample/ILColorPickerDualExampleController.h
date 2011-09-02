//
//  ILColorPickerExampleViewController.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILSaturationBrightnessPicker.h"
#import "ILHuePicker.h"

@interface ILColorPickerDualExampleController : UIViewController<ILSaturationBrightnessPickerDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILSaturationBrightnessPicker *colorPicker;
    IBOutlet ILHuePicker *huePicker;
}

@end
