//
//  locationViewController.h
//  location
//
//  Created by Patrick Zearfoss on 7/26/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface locationViewController : UIViewController <UITableViewDataSource, CLLocationManagerDelegate>
{
    NSMutableArray *locations;
    CLLocationManager *locationManager;
    UITableView *tableView;
}

- (IBAction)addLocationTap:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
