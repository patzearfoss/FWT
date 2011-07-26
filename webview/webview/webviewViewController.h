//
//  webviewViewController.h
//  webview
//
//  Created by Patrick Zearfoss on 7/24/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webviewViewController : UIViewController <UIWebViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIWebView *webview;
}

@property (nonatomic, retain) IBOutlet UIWebView *webview;
@end
