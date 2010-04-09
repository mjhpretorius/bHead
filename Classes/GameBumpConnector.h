#import <Foundation/Foundation.h>
#import "Bump.h"

@class subclassChallengeController;

@interface GameBumpConnector : NSObject <BumpDelegate> {
	subclassChallengeController *bHeadGame;  
	Bump *bumpObject;
	
	NSString* otherweaponChoice;
	NSString* yourweaponChoice;
	NSString* winorlose;
}

@property (nonatomic, assign) subclassChallengeController *bHeadGame;

- (void) startBump;
- (void) shareViaBump;
- (void) stopBump;
- (NSString*) givewinorlose;
- (NSString*) giveOpponentWeapon;
//- (void) sendWeapon:(NSString*)weapon;

- (NSString*) resultFormula;


@end
