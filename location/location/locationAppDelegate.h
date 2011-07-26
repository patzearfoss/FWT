//
//  locationAppDelegate.h
//  location
//
//  Created by Patrick Zearfoss on 7/26/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class locationViewController;

@interface locationAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet locationViewController *viewController;

@end
