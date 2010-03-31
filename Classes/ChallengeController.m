//
//  ChallengeController.m
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChallengeController.h"
#import "subclassChallengeController.h"


@implementation ChallengeController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction) logData:(id)sender
{
	NSLog(@"Button Pushed");
	subclassChallengeController *weaponView = [[subclassChallengeController alloc] initWithNibName:@"subclassChallengeController" bundle:nil];
	[self.navigationController pushViewController:weaponView animated:YES];
	[weaponView release];
}

- (void)dealloc {
    [super dealloc];
}


@end
