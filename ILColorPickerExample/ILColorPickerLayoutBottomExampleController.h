//
//  ILColorPickerLayoutBottomExampleController.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILColorPickerView.h"

@interface ILColorPickerLayoutBottomExampleController : UIViewController<ILColorPickerViewDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILColorPickerView *colorPicker;

}

@end
