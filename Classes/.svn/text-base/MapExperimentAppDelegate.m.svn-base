//
//  SJSU_MapAppDelegate.m
//  SJSU Map
//
//  Created by Alben Cheung on 3/6/10.
//  Copyright San Jose State University 2010. All rights reserved.
//

#import "MapExperimentAppDelegate.h"


@implementation MapExperimentAppDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
//	navigationController.dataSource = [[NSMutableArray alloc]init];
//	for(char c = 'A';c<='Z';c++)
//		[navigationController.dataSource addObject:[NSString stringWithFormat:@"%cTestString",c]];
//	UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:navigationController];
//	viewController.title = @"Search";
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

