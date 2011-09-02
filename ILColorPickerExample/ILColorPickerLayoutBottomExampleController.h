//
//  ILColorPickerLayoutBottomExampleController.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILColorPicker.h"

@interface ILColorPickerLayoutBottomExampleController : UIViewController<ILColorPickerDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILColorPicker *colorPicker;

}

@end
