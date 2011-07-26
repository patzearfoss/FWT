//
//  locationViewController.m
//  location
//
//  Created by Patrick Zearfoss on 7/26/11.
//  Copyright 2011 Mindgrub Technologies. All rights reserved.
//

#import "locationViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation locationViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [locationManager release];
    [locations release];
    [super dealloc];
}

#pragma mark - View lifecycle



- (void)viewDidLoad
{
    [super viewDidLoad];
    locations = [[NSMutableArray alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    
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

- (IBAction)addLocationTap:(id)sender
{
    [locationManager startUpdatingLocation];
    
    // this dies on lion, we'll fake it 39.18 76.67
    CLLocation *location = [[CLLocation alloc] initWithLatitude:39.18 longitude:76.67];
    [locations addObject:location];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[locations count] - 1 inSection:0];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [locations count];
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"] autorelease];
    }
    
    CLLocation *location = [locations objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%f, %f", location.coordinate.latitude, location.coordinate.longitude];
    cell.detailTextLabel.text = [location.timestamp description];
    
    return cell;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locations addObject:newLocation];
    [locationManager stopUpdatingLocation];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[locations count] inSection:0];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

@end
