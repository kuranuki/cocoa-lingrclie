//
//  AppController.m
//  LingrClie
//
//  Created by 倉貫 義人 on 09/02/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "Lingr.h"

@implementation AppController

- (IBAction)createSession:(id)sender {

	NSString* title = [Lingr createSession];
	
	[textField setStringValue:title];
	
	sessionID = title;
}

- (IBAction)destroySession:(id)sender {

	NSString* title = [Lingr destroySession:sessionID];
	
	[resultLabel setStringValue:title];
	
	sessionID = nil;
}

- (IBAction)say:(id)sender {

	NSString* room_ticket =
		[Lingr callAPI:@"room/enter"
		inputParameter:[NSString stringWithFormat:@"session=%@&id=sonicgarden&nickname=api-dude&password=kaneyan", sessionID]
			resultPath:@"/response/ticket"];
	
	NSString* comment = [commentTextField stringValue];
	
	NSString* result =
		[Lingr callAPI:@"room/say"
		inputParameter:[NSString stringWithFormat:@"session=%@&ticket=%@&message=%@", sessionID, room_ticket, comment]
			resultPath:@"/response/status"];

	[commentTextField setStringValue:result];
}

@end
