//
//  ChallengeController.h
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChallengeController : UIViewController 
{
	IBOutlet UIButton* lightsaber;
	IBOutlet UIButton* shotgun;
	IBOutlet UIButton* broadsword;
}

- (IBAction) logData:(id)sender;

@end
