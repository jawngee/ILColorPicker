//
//  ILColorPickerLayoutBottomExampleController.m
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "ILColorPickerLayoutBottomExampleController.h"


@implementation ILColorPickerLayoutBottomExampleController

#pragma mark - ILColorPickerDelegate

-(void)colorPicked:(UIColor *)color forPicker:(ILColorPicker *)picker
{
    colorChip.backgroundColor=color;
}

@end
