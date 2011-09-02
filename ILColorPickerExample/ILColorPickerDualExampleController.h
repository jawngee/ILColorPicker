//
//  ILColorPickerExampleViewController.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILSaturationBrightnessPickerView.h"
#import "ILHuePickerView.h"

@interface ILColorPickerDualExampleController : UIViewController<ILSaturationBrightnessPickerViewDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILSaturationBrightnessPickerView *colorPicker;
    IBOutlet ILHuePickerView *huePicker;
}

@end
