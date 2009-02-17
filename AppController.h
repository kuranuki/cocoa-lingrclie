//
//  AppController.h
//  LingrClie
//
//  Created by 倉貫 義人 on 09/02/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject {

	NSString* sessionID;
	
	IBOutlet id textField;
	IBOutlet id resultLabel;
	
	IBOutlet id commentTextField;
}

- (IBAction)createSession:(id)sender;
- (IBAction)destroySession:(id)sender;
- (IBAction)say:(id)sender;

@end
