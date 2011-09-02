//
//  ILColorPickerExampleAppDelegate.h
//  ILColorPickerExample
//
//  Created by Jon Gilkison on 9/1/11.
//  Copyright 2011 Interfacelab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILColorPickerExampleViewController;

@interface ILColorPickerExampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ILColorPickerExampleViewController *viewController;

@end
