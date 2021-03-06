//
//  subclassChallengeController.h
//  bHead
//
//  Created by MJ Hasson on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBumpConnector.h"


@interface subclassChallengeController : UIViewController <UITextFieldDelegate>
{
	IBOutlet UILabel* weaponSelection;
	IBOutlet UILabel* opponentSelection;
	IBOutlet UILabel* gameOutcome;
	IBOutlet UITextField* myField;
	NSString* otherweaponText;
	NSString* yourweaponText;
	IBOutlet UIImageView* bgImage;
		
	GameBumpConnector* bumpObject;
}

- (NSString*) giveotherWeapon;
- (NSString*) giveyourWeapon;
- (void) setLabels;


@end
