//
//  Hello_WorldAppDelegate.h
//  Hello World
//
//  Created by Patrick Zearfoss on 7/14/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hello_WorldViewController;

@interface Hello_WorldAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Hello_WorldViewController *viewController;

@end
