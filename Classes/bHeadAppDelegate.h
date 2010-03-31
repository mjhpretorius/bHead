//
//  bHeadAppDelegate.h
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bHeadAppDelegate : NSObject <UIApplicationDelegate> 
{
	IBOutlet UITabBarController		*tabBarController;
	UIWindow						*window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

