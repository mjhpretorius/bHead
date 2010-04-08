//
//  subclassChallengeController.m
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "subclassChallengeController.h"
#import "GameBumpConnector.h"


@implementation subclassChallengeController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabel:) name:@"weaponButton" object:nil];
	}
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	bumpObject = [[GameBumpConnector alloc] init];
	bumpObject.bHeadGame = self; // dragged from gameconnector to bhead
	[bumpObject startBump];
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)changeLabel:(NSNotification*)notification
{
	UIButton* wb = (UIButton*)[notification object];
	weaponSelection.text = [wb currentTitle];
	//NSLog([NSString stringWithFormat:@"Sent: %@", [wb currentTitle]]);
	otherweaponText = [wb currentTitle];
	yourweaponText = [wb currentTitle];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (NSString*)giveotherWeapon{
	return otherweaponText;
}

- (NSString*)giveyourWeapon{
	return yourweaponText;
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
