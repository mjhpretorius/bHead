#import <Foundation/Foundation.h>
#import "Bump.h"

@class subclassChallengeController;

@interface GameBumpConnector : NSObject <BumpDelegate> {
	subclassChallengeController *bHeadGame;  
	Bump *bumpObject;
}

@property (nonatomic, assign) subclassChallengeController *bHeadGame;

- (void) startBump;
- (void) shareViaBump;
- (void) stopBump;

@end
