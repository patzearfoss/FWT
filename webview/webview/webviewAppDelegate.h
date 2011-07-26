//
//  webviewAppDelegate.h
//  webview
//
//  Created by Patrick Zearfoss on 7/24/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class webviewViewController;

@interface webviewAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet webviewViewController *viewController;

@end
