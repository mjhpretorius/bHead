#import "GameBumpConnector.h"
#import "subclassChallengeController.h"

@implementation GameBumpConnector
@synthesize bHeadGame;

- (id) init{
	if(self = [super init]){
		bumpObject = [[Bump alloc] init];
	}
	return self;
}

-(void) configBump{
	[bumpObject configAPIKey:@"883f6348ac6e43ff8b47e85813dc1549"];
}

- (void) startBump{
	[self configBump];
	[bumpObject setDelegate:self];
	[bumpObject configHistoryMessage:@"%1 just started a BumpFour match with %2!"];
	[bumpObject configActionMessage:@"Bump with another bHead player to fight."];
	[bumpObject connect];
}

- (void) shareViaBump{
	[self configBump];	
	[bumpObject setDelegate:self];
	[bumpObject configHistoryMessage:@"%1 just shared BumpFour for the iPhone with %2!"];
	[bumpObject configActionMessage:@"Bump with someone running the standalone Bump app to share bHead."];
	[bumpObject connectToShareThisApp];	
}

- (void) stopBump{	
	[bumpObject disconnect];
}

#pragma mark -
#pragma mark BumpDelegate methods

- (void) bumpDidConnect {
	//Create a dictionary describing the move to the other client.
	//We chose to send a dictionary for our communications for this example,
	//But you can use any type of data you like, as long as you convert it to an NSData object.
	NSMutableDictionary *weaponDict = [[NSMutableDictionary alloc] initWithCapacity:5];
	//[weaponDict setObject:[NSString stringWithFormat:@"%d", column]  forKey:@"MOVED_COLUMN"];
	NSString* otherweaponVariable = [bHeadGame giveotherWeapon];
	[weaponDict setObject:[NSString stringWithFormat:@"%@", otherweaponVariable]  forKey:@"otherWEAPON"];
	//Now we need to package our move dictionary up into an NSData object so we can send it up to Bump.
	//We'll do that with with an NSKeyedArchiver.
	NSData *weaponChunk = [NSKeyedArchiver archivedDataWithRootObject:weaponDict];
	//[self printDict:moveDict];
	[weaponDict release];
	
	//Calling send will have bump send the data up to the other user's mailbox.
	//The other user will get a bumpDataReceived: callback with an identical NSData* chunk shortly.
	//packetsAttempted++;
	[bumpObject send:weaponChunk];
	NSLog(@"bump did connect");
	
}

- (void) bumpDataReceived:(NSData *)chunk{
	//The chunk was packaged by the other user using an NSKeyedArchiver, so we unpackage it here with our NSKeyedUnArchiver
	NSDictionary *responseDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:chunk];
	//[self printDict:responseDictionary];
	
	//	//responseDictionary no contains an Identical dictionary to the one that the other user sent us
	otherweaponChoice = [responseDictionary objectForKey:@"otherWEAPON"];
	yourweaponChoice = [bHeadGame giveyourWeapon];
	//	NSString *gameAction = [responseDictionary objectForKey:@"GAME_ACTION"];
	//	
	NSLog(@"the other players weapon choice is %@", otherweaponChoice);
	NSLog(@"your weapon choice is %@", yourweaponChoice);
	
	NSString* result = [self resultFormula];
	NSLog(@"you are a %@", result);
	//	
	//	if([gameAction isEqualToString:@"MOVE"]){
	//		NSString *column = [responseDictionary objectForKey:@"MOVED_COLUMN"];
	//		NSLog(@"opponent moved to column %@", column);
	//		
	//		[bumpFourGame columnSelected:[column integerValue]];
	//	}
	//	
	//	if([gameAction isEqualToString:@"DETERMINE_PLAYER_1"]){
	//		NSString *tryNumber = [responseDictionary objectForKey:@"DICE_ROLL_TRY_NUM"];
	//		NSString *roll = [responseDictionary objectForKey:@"DICE_ROLL_VALUE"];
	//		NSLog(@"opponent rolled a %@ on try number %@", roll, tryNumber);
	//		
	//		opponentRollNumber = [tryNumber integerValue];
	//		opponentRoll = [roll integerValue];
	//		[self determineFirstPlayer];
	//	}
	//	
	//	if([gameAction isEqualToString:@"QUIT_GAME"]){
	//		NSLog(@"opponent has quit the game");
	//		//TODO: notify the subsystem that the opponent has quit
	//		// restart the app
	//	}
}

- (NSString*)resultFormula{
	// could make this shorter, but for debugging, I made it this way
	if([otherweaponChoice isEqualToString: @"LIGHTSABER"] && [yourweaponChoice isEqualToString: @"SHOTGUN"]) 
	{
		return @"WINNER!";
	}
	if([otherweaponChoice isEqualToString: @"SHOTGUN"] && [yourweaponChoice isEqualToString: @"BROADSWORD"])
	{
		return @"WINNER!";
	}
	if([otherweaponChoice isEqualToString: @"BROADSWORD"] && [yourweaponChoice isEqualToString: @"LIGHTSABER"])
	{
		return @"WINNER!";
	}
	else 
	{
		return @"LOSER!";
	}

}

- (void) bumpSendSuccess{
	//This callback method lets you know that the [Bump send:] method that you called was succesful in sending your chunk up to Bump's server.
	//This doesn't guarantee that the other handset has received the chunk.
	NSLog(@"bump send success");
}

- (void) bumpDidDisconnect:(BumpDisconnectReason)reason{
	NSString *alertText;
	switch (reason) {
		case END_OTHER_USER_QUIT:
			alertText = @"Other user has quit the game.";
			break;
		case END_LOST_NET:
			alertText = @"Connection to Bump server was lost.";
			break;
		case END_OTHER_USER_LOST:
			alertText = @"Connection to other user was lost.";
			break;
		case END_USER_QUIT:
			alertText = @"You have been disconnected.";
			break;
		default:
			alertText = @"You have been disconnected.";
			break;
	}
	/*
	if(reason != END_USER_QUIT){ 
		//if the local user initiated the quit,restarting the app is already being handled
		//other wise we'll restart here
		[bHeadGame restartProgram];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disconnected" message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}*/
	NSLog(@"bump did disconnect");
}

- (void) bumpConnectFailed:(BumpConnectFailedReason)reason{
	
	NSString *alertText;
	switch (reason) {
		case FAIL_NETWORK_UNAVAILABLE:
			alertText = @"Please check your network settings and try again.";
			break;
		case FAIL_INVALID_AUTHORIZATION:
			//the user should never see this, since we'll pass in the correct API auth strings.
			//just for debug.
			alertText = @"Failed to connect to the Bump service. Auth error.";
			break;
		default:
			alertText = @"Failed to connect to the Bump service.";
			break;
	}
	
	/*[bHeadGame restartProgram];
	if(reason != FAIL_USER_CANCELED){
		//if the user canceled they know it and they don't need a popup.
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}*/
}

@end