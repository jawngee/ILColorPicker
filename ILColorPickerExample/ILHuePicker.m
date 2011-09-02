//
//  ILHuePicker.m
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import "ILHuePicker.h"
#import "UIColor+GetHSB.h"

@interface ILHuePicker(Private)

-(void)handleTouches:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@implementation ILHuePicker

@synthesize color, delegate, hue;

#pragma mark - Setup

-(void)setup
{
    [super setup];
    
    self.clipsToBounds=YES;
    
    hue=0.5;
}

#pragma mark - Drawing

-(void)drawRect:(CGRect)rect
{
    // draw the hue gradient
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    float step=0.166666666666667f;
    
    CGFloat locs[7]={ 
        0.00f, 
        step, 
        step*2, 
        step*3, 
        step*4, 
        step*5, 
        1.0f
    };
    
    NSArray *colors=[NSArray arrayWithObjects:
                     (id)[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0] CGColor], 
                     (id)[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] CGColor], 
                     nil];
    
    CGGradientRef grad=CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, locs);
    CGContextDrawLinearGradient(context, grad, CGPointMake(rect.size.width,0), CGPointMake(0, 0), 0);
    CGGradientRelease(grad);
     
    CGColorSpaceRelease(colorSpace);
    
    // Draw the indicator
    float pos=rect.size.width*hue;
    float indLength=rect.size.height/3;
    
    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetShadow(context, CGSizeMake(0, 0), 4);

    CGContextMoveToPoint(context, pos-(indLength/2), -1);
    CGContextAddLineToPoint(context, pos+(indLength/2), -1);
    CGContextAddLineToPoint(context, pos, indLength);
    CGContextAddLineToPoint(context, pos-(indLength/2), -1);

    CGContextMoveToPoint(context, pos-(indLength/2), rect.size.height+1);
    CGContextAddLineToPoint(context, pos+(indLength/2), rect.size.height+1);
    CGContextAddLineToPoint(context, pos, rect.size.height-indLength);
    CGContextAddLineToPoint(context, pos-(indLength/2), rect.size.height+1);

    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - Touches

-(void)handleTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos=[[touches anyObject] locationInView:self];
    
    if (pos.x<0)
        hue=0;
    else if (pos.x>self.frame.size.width)
        hue=1;
    else
        hue=pos.x/self.frame.size.width;
    
    [delegate huePicked:hue picker:self];
    
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

#pragma mark - Property Setters

-(void)setHue:(float)h
{
    hue=h;
    [self setNeedsDisplay];
}

#pragma mark - Current color

-(void)setColor:(UIColor *)cc
{
    HSBType hsb=[cc HSB];
    
    hue=hsb.hue;
    [self setNeedsDisplay];
}

-(UIColor *)color
{
    return [UIColor colorWithHue:hue saturation:1.0f brightness:1.0f alpha:1.0];
}

@end
