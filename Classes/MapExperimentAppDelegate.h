//
//  SJSU_MapAppDelegate.h
//  SJSU Map
//
//  Created by Alben Cheung on 3/6/10.
//  Copyright San Jose State University 2010. All rights reserved.
//


@interface MapExperimentAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@end

