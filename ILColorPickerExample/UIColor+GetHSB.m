//
//  UIColor+GetHSB.m
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/2/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "UIColor+GetHSB.h"


@implementation UIColor(GetHSB)

-(HSBType)HSB
{
    HSBType hsb;
    
    hsb.hue=0;
    hsb.saturation=0;
    hsb.brightness=0;
    
    CGColorSpaceModel model=CGColorSpaceGetModel(CGColorGetColorSpace([self CGColor]));
    
    if ((model==kCGColorSpaceModelMonochrome) || (model==kCGColorSpaceModelRGB))
    {
        const CGFloat *c = CGColorGetComponents([self CGColor]);  
        
        float x = fminf(c[0], c[1]);
        x = fminf(x, c[2]);
        
        float b = fmaxf(c[0], c[1]);
        b = fmaxf(b, c[2]);
        
        if (b == x) 
        {
            hsb.hue=0;
            hsb.saturation=0;
            hsb.brightness=b;
        }
        else
        {
            float f = (c[0] == x) ? c[1] - c[2] : ((c[1] == x) ? c[2] - c[0] : c[0] - c[1]);
            int i = (c[0] == x) ? 3 : ((c[1] == x) ? 5 : 1);
            
            hsb.hue=((i - f /(b - x))/6);
            hsb.saturation=(b - x)/b;
            hsb.brightness=b;
        }
    }
    
    return hsb;
}


@end
