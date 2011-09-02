//
//  UIColor+GetHSB.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    float hue;
    float saturation;
    float brightness;
} HSBType;

@interface UIColor(GetHSB)

-(HSBType)HSB;

@end
