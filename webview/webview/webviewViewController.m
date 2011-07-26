//
//  webviewViewController.m
//  webview
//
//  Created by Patrick Zearfoss on 7/24/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import "webviewViewController.h"

@implementation webviewViewController
@synthesize webview;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error;
    NSString *filename = [[NSBundle mainBundle] 
                          pathForResource:@"webview" ofType:@"html"];
    
    NSString *html = [NSString stringWithContentsOfFile:filename 
                                               encoding:NSUTF8StringEncoding 
                                                  error:&error];
    [webview loadHTMLString:html 
                    baseURL:nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)webView:(UIWebView *)webView 
   shouldStartLoadWithRequest:(NSURLRequest *)request 
   navigationType:(UIWebViewNavigationType)navigationType
{

    if ([[[request URL] absoluteString] isEqualToString:@"http://getphoto/"])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.modalPresentationStyle = UIModalTransitionStyleCoverVertical;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
        return NO;
 
    }
    return YES;
    
    BOOL isSet = YES;
}

//http://stackoverflow.com/questions/4957972/iphone-uiimagepickercontroller-save-the-image-to-app-folder
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"latest_photo.png"];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];   
    if ([mediaType isEqualToString:@"public.image"])
    {
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSData *webData = UIImagePNGRepresentation(editedImage);
        [webData writeToFile:imagePath atomically:YES];
    }
    
    
    NSURL *mediaURL = [NSURL fileURLWithPath:imagePath];
    
    NSString *js = [NSString stringWithFormat:@"var image=document.getElementById('image');image.src = '%@'", [mediaURL absoluteString]];
    NSString *res = [webview stringByEvaluatingJavaScriptFromString:js];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
