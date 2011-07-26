//
//  HelloYouAppDelegate.h
//  HelloYou
//
//  Created by Patrick Zearfoss on 7/14/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloYouViewController;

@interface HelloYouAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloYouViewController *viewController;

@end
