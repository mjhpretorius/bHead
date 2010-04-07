typedef enum BumpDisconnectReason {
	END_USER_QUIT, //The local user quit cleanly
	END_LOST_NET,  //The connection to the server was lost
	END_OTHER_USER_QUIT, //the remote user quit cleanly
	END_OTHER_USER_LOST  //the connection to the remote user was lost
} BumpDisconnectReason;

typedef enum BumpConnectFailedReason {
	FAIL_NONE,
	FAIL_USER_CANCELED, //The local user canceled before connecting
	FAIL_NETWORK_UNAVAILABLE, //The network was unavailable, and the local user canceled.
	FAIL_INVALID_AUTHORIZATION, //The APIKey was invalid
	FAIL_EXCEEDED_RATE_LIMIT,
	FAIL_EXPIRED_KEY
} BumpConnectFailedReason;

@class BumpHandsView;
@class BumpRoundedRectView;
@protocol BumpDelegate <NSObject>
- (void) bumpDidConnect;
- (void) bumpDidDisconnect:(BumpDisconnectReason)reason;
- (void) bumpConnectFailed:(BumpConnectFailedReason)reason;
- (void) bumpDataReceived:(NSData *)chunk;
@optional
- (void) bumpShareAppLinkSent;
- (void) bumpSendSuccess;
@end

@interface Bump : NSObject {
	id<BumpDelegate> delegate;
}

@property (nonatomic, assign) id<BumpDelegate> delegate;

-(void) connect;
-(void) connectToShareThisApp;
-(void) disconnect;

-(void) send:(NSData *)chunk;
-(void) configAPIKey:(NSString *)apiKey;
-(void) configActionMessage:(NSString *)actionMessage;
-(void) configHistoryMessage:(NSString *)feed;
-(void) configUserName:(NSString *)name;
-(NSString *) userName;
-(NSString *) otherUserName;

// End public interface for Bump API
//------------------------------------------------------------------------------------------------


/*
 *	Bump Api Private Actions and Outlets. These Are not meant to be touched by bump Api customers.
 *	These actions and outlets simply provide support for the BumpAPI UI's .nib files.
 *	Please ignore below.
 */
- (IBAction) bumpPrivateAction01;
- (IBAction) bumpPrivateAction02;
- (IBAction) bumpPrivateAction03;
- (IBAction) bumpPrivateAction04;
- (IBAction) bumpPrivateAction05;
- (IBAction) bumpPrivateAction06;
@property (nonatomic, assign) IBOutlet UIView *private_apiPopupContentView;
@property (nonatomic, assign) IBOutlet UIView *private_nameView;
@property (nonatomic, assign) IBOutlet UIView *private_messageFlagView;
@property (nonatomic, assign) IBOutlet UIButton *private_changeNameButton;
@property (nonatomic, assign) IBOutlet UITextField *private_setupNameField;
@property (nonatomic, assign) IBOutlet UILabel *private_statusText;
@property (nonatomic, assign) IBOutlet UILabel *private_messageFlagText;
@property (nonatomic, assign) IBOutlet UILabel *private_promptText;
@property (nonatomic, assign) IBOutlet UILabel *private_nameLabel;
@property (nonatomic, assign) IBOutlet UIImageView *private_bumpLogoView;
@property (nonatomic, assign) IBOutlet UIImageView *private_noNetworkAccesory;
@property (nonatomic, assign) IBOutlet UIActivityIndicatorView *private_activityAccesory;
@property (nonatomic, assign) IBOutlet UIActivityIndicatorView *private_activitySpinner;
@property (nonatomic, assign) IBOutlet BumpHandsView *private_handsView;
@property (nonatomic, assign) IBOutlet BumpRoundedRectView *private_popupBezel;
@end
