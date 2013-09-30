//
//  AppDelegate.m
//  Regions
//
//  Created by Spiros Gerokostas on 9/30/13.
//  Copyright (c) 2013 Spiros Gerokostas. All rights reserved.
//

#import "RegionsAppDelegate.h"
#import "RegionsViewController.h"

@implementation RegionsAppDelegate

@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.viewController = [[RegionsViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	
	// Reset the icon badge number to zero.
	[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	
	if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
		// Stop normal location updates and start significant location change updates for battery efficiency.
		[self.viewController.locationManager stopUpdatingLocation];
		[self.viewController.locationManager startMonitoringSignificantLocationChanges];
	}
	else {
		NSLog(@"Significant location change monitoring is not available.");
	}
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	
	if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
		// Stop significant location updates and start normal location updates again since the app is in the forefront.
		[self.viewController.locationManager stopMonitoringSignificantLocationChanges];
		[self.viewController.locationManager startUpdatingLocation];
	}
	else {
		NSLog(@"Significant location change monitoring is not available.");
	}
	
	if (!self.viewController.updatesTableView.hidden) {
		// Reload the updates table view to reflect update events that were recorded in the background.
		[self.viewController.updatesTableView reloadData];
        
		// Reset the icon badge number to zero.
		[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	}
}


- (void)applicationWillResignActive:(UIApplication *)application {
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate.
}

@end
