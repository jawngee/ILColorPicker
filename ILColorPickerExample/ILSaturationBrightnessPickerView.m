//
//  ILSaturationBrightnessPicker.m
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "ILSaturationBrightnessPickerView.h"
#import "UIColor+GetHSB.h"

@implementation ILSaturationBrightnessPickerView

@synthesize color, delegate, hue, saturation, brightness;

#pragma mark - Setup

-(void)setup
{
    [super setup];
    
    self.clipsToBounds=NO;
    self.opaque=NO;
    self.backgroundColor=[UIColor clearColor];
    self.bounds=CGRectInset(self.bounds, -14, -14);
    
    hue=0;
    saturation=1;
    brightness=1;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    // inset the rect
    rect=CGRectInset(rect, 14, 14);
    
    // draw the photoshop gradient
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextClipToRect(context, rect);
    
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    CGFloat locs[2]={ 0.00f, 1.0f };

    NSArray *colors=[NSArray arrayWithObjects:
            (id)[[UIColor colorWithHue:hue saturation:1 brightness:1 alpha:1.0] CGColor],
            (id)[[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] CGColor], 
            nil];
    
    CGGradientRef grad=CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, locs);
    CGContextDrawLinearGradient(context, grad, CGPointMake(rect.size.width,0), CGPointMake(0, 0), 0);
    CGGradientRelease(grad);

    colors=[NSArray arrayWithObjects:
            (id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0] CGColor], 
            (id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0] CGColor], 
            nil];
    
    grad=CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, locs);
    CGContextDrawLinearGradient(context, grad, CGPointMake(0, 0), CGPointMake(0, rect.size.height), 0);
    CGGradientRelease(grad);
    
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);
    
    // draw the reticule
    
    CGPoint realPos=CGPointMake(saturation*rect.size.width, rect.size.height-(brightness*rect.size.height));
    CGRect reticuleRect=CGRectMake(realPos.x-10, realPos.y-10, 20, 20);
    
    CGContextAddEllipseInRect(context, reticuleRect);
    CGContextAddEllipseInRect(context, CGRectInset(reticuleRect, 4, 4));
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextSetLineWidth(context, 0.5);
    CGContextClosePath(context);
    CGContextSetShadow(context, CGSizeMake(1, 1), 4);
    CGContextDrawPath(context, kCGPathEOFillStroke);
}

#pragma mark - Hue Selector Delegate

-(void)huePicked:(float)h picker:(ILHuePickerView *)picker
{
    hue=h;

    [delegate colorPicked:[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0] forPicker:self];

    [self setNeedsDisplay];
}

#pragma mark - Touches

-(void)handleTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos=[[touches anyObject] locationInView:self];
    
    float w=self.frame.size.width-28;
    float h=self.frame.size.height-28;
    
    if (pos.x<0)
        saturation=0;
    else if (pos.x>w)
        saturation=1;
    else
        saturation=pos.x/w;
    
    if (pos.y<0)
        brightness=1;
    else if (pos.y>h)
        brightness=0;
    else
        brightness=1-(pos.y/h);
    
    [delegate colorPicked:[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0] forPicker:self];
    
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches withEvent:event];
}

#pragma mark - Property setters

-(void)setHue:(float)h
{
    hue=h;
    [self setNeedsDisplay];
}

-(void)setBrightness:(float)b
{
    brightness=b;
    [self setNeedsDisplay];
}

-(void)setSaturation:(float)s
{
    saturation=s;
    [self setNeedsDisplay];
}

#pragma mark - Current color

-(void)setColor:(UIColor *)cc
{
    HSBType hsb=[cc HSB];
    
    hue=hsb.hue;
    saturation=hsb.saturation;
    brightness=hsb.brightness;
    
    [self setNeedsDisplay];
}

-(UIColor *)color
{
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0];
}

@end
