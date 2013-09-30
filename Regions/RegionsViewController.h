//
//  RegionsViewController.h
//  Regions
//
//  Created by Spiros Gerokostas on 9/30/13.
//  Copyright (c) 2013 Spiros Gerokostas. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RegionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate, UINavigationBarDelegate>

@property (nonatomic, strong) MKMapView *regionsMapView;
@property (nonatomic, strong) UITableView *updatesTableView;
@property (nonatomic, strong) NSMutableArray *updateEvents;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (IBAction)switchViews;
- (IBAction)addRegion;
- (void)updateWithEvent:(NSString *)event;

@end
