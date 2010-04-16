//
//  bHeadAppDelegate.m
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "bHeadAppDelegate.h"

@implementation bHeadAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
	[window addSubview:tabBarController.view];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application 
{
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
