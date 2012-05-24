//
//  SLAppDelegate.h
//  Example
//
//  Created by Aaron Brethorst on 5/24/12.
//  Copyright (c) 2012 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLViewController;

@interface SLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SLViewController *viewController;

@end
