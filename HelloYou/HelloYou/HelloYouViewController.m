//
//  HelloYouViewController.m
//  HelloYou
//
//  Created by Patrick Zearfoss on 7/14/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import "HelloYouViewController.h"

@implementation HelloYouViewController
@synthesize textField, button, label, name;

- (void)dealloc
{
    [label release];
    [textField release];
    [button release];
    [name release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

- (IBAction)buttonTap:(UIButton *)sender
{
    if (textField.text && ![textField.text isEqualToString:@""])
    {
        self.name = textField.text;
        label.text = [NSString stringWithFormat:@"Hello %@", self.name];
        [textField resignFirstResponder];
        textField.text = @"";
    }
}

@end
