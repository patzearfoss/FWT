//
//  HelloYouViewController.h
//  HelloYou
//
//  Created by Patrick Zearfoss on 7/14/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloYouViewController : UIViewController 
{
    UILabel *label;
    UIButton *button;
    UITextField *textField;
    
    NSString *name;
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, copy) NSString *name;

- (IBAction)buttonTap:(UIButton *)sender;

@end
